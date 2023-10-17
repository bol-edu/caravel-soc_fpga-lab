#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_ps_mprj_in "../tv/cdatafile/c.caravel_ps.autotvin_ps_mprj_in.dat"
#define AUTOTB_TVOUT_ps_mprj_in "../tv/cdatafile/c.caravel_ps.autotvout_ps_mprj_in.dat"
#define AUTOTB_TVIN_ps_mprj_out "../tv/cdatafile/c.caravel_ps.autotvin_ps_mprj_out.dat"
#define AUTOTB_TVOUT_ps_mprj_out "../tv/cdatafile/c.caravel_ps.autotvout_ps_mprj_out.dat"
#define AUTOTB_TVIN_ps_mprj_en "../tv/cdatafile/c.caravel_ps.autotvin_ps_mprj_en.dat"
#define AUTOTB_TVOUT_ps_mprj_en "../tv/cdatafile/c.caravel_ps.autotvout_ps_mprj_en.dat"
#define AUTOTB_TVIN_mprj_in "../tv/cdatafile/c.caravel_ps.autotvin_mprj_in.dat"
#define AUTOTB_TVOUT_mprj_in "../tv/cdatafile/c.caravel_ps.autotvout_mprj_in.dat"
#define AUTOTB_TVIN_mprj_out "../tv/cdatafile/c.caravel_ps.autotvin_mprj_out.dat"
#define AUTOTB_TVOUT_mprj_out "../tv/cdatafile/c.caravel_ps.autotvout_mprj_out.dat"
#define AUTOTB_TVIN_mprj_en "../tv/cdatafile/c.caravel_ps.autotvin_mprj_en.dat"
#define AUTOTB_TVOUT_mprj_en "../tv/cdatafile/c.caravel_ps.autotvout_mprj_en.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_ps_mprj_in "../tv/rtldatafile/rtl.caravel_ps.autotvout_ps_mprj_in.dat"
#define AUTOTB_TVOUT_PC_ps_mprj_out "../tv/rtldatafile/rtl.caravel_ps.autotvout_ps_mprj_out.dat"
#define AUTOTB_TVOUT_PC_ps_mprj_en "../tv/rtldatafile/rtl.caravel_ps.autotvout_ps_mprj_en.dat"
#define AUTOTB_TVOUT_PC_mprj_in "../tv/rtldatafile/rtl.caravel_ps.autotvout_mprj_in.dat"
#define AUTOTB_TVOUT_PC_mprj_out "../tv/rtldatafile/rtl.caravel_ps.autotvout_mprj_out.dat"
#define AUTOTB_TVOUT_PC_mprj_en "../tv/rtldatafile/rtl.caravel_ps.autotvout_mprj_en.dat"


static const bool little_endian()
{
  int a = 1;
  return *(char*)&a == 1;
}

inline static void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    rev_endian(p, dbytes);
    vp = (p_dat) (p+dbytes);
  }

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
      if (little_endian()) {
        rev_endian(vp[i], wbytes);
      }
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};


inline static const std::string begin_str(int num)
{
  return std::string("[[transaction]]           ")
         .append(std::to_string(num))
         .append("\n");
}

inline static const std::string end_str()
{
  return std::string("[[/transaction]]\n");
}

const std::string formatData(unsigned char *pos, size_t wbits)
{
  bool LE = little_endian();
  size_t wbytes = (wbits+7)>>3;
  size_t i = LE ? wbytes-1 : 0;
  auto next = [&] () {
    auto c = pos[i];
    LE ? --i : ++i;
    return c;
  };
  std::ostringstream ss;
  ss << "0x";
  if (int t = (wbits & 0x7)) {
    if (t <= 4) {
      unsigned char mask = (1<<t)-1;
      ss << std::hex << std::setfill('0') << std::setw(1)
         << (int) (next() & mask);
      wbytes -= 1;
    }
  }
  for (size_t i = 0; i < wbytes; ++i) {
    ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
  }
  ss.put('\n');
  return ss.str();
}

static bool RTLOutputCheckAndReplacement(std::string &data)
{
  bool changed = false;
  for (size_t i = 2; i < data.size(); ++i) {
    if (data[i] == 'X' || data[i] == 'x') {
      data[i] = '0';
      changed = true;
    }
  }
  return changed;
}

struct SimException : public std::exception {
  const char *msg;
  const size_t line;
  SimException(const char *msg, const size_t line)
    : msg(msg), line(line)
  {
  }
};

template<size_t bit_width>
class PostCheck
{
  static const char *bad;
  static const char *err;
  std::fstream stream;
  std::string s;

  void send(char *p, ap_uint<bit_width> &data, size_t l, size_t rest)
  {
    if (rest == 0) {
      if (!little_endian()) {
        const size_t wbytes = (bit_width+7)>>3;
        rev_endian(p-wbytes, wbytes);
      }
    } else if (rest < 8) {
      *p = data.range(l+rest-1, l).to_uint();
      send(p+1, data, l+rest, 0);
    } else {
      *p = data.range(l+8-1, l).to_uint();
      send(p+1, data, l+8, rest-8);
    }
  }

  void readline()
  {
    std::getline(stream, s);
    if (stream.eof()) {
      throw SimException(bad, __LINE__);
    }
  }

public:
  char *param;
  size_t psize;
  size_t depth;

  PostCheck(const char *file)
  {
    stream.open(file);
    if (stream.fail()) {
      throw SimException(err, __LINE__);
    } else {
      readline();
      if (s != "[[[runtime]]]") {
        throw SimException(bad, __LINE__);
      }
    }
  }

  ~PostCheck() noexcept(false)
  {
    stream.close();
  }

  void run(size_t AESL_transaction_pc, size_t skip)
  {
    if (stream.peek() == '[') {
      readline();
    }

    for (size_t i = 0; i < skip; ++i) {
      readline();
    }

    bool foundX = false;
    for (size_t i = 0; i < depth; ++i) {
      readline();
      foundX |= RTLOutputCheckAndReplacement(s);
      ap_uint<bit_width> data(s.c_str(), 16);
      send(param+i*psize, data, 0, bit_width);
    }
    if (foundX) {
      std::cerr << "WARNING: [SIM 212-201] RTL produces unknown value "
                << "'x' or 'X' on some port, possible cause: "
                << "There are uninitialized variables in the design.\n";
    }

    if (stream.peek() == '[') {
      readline();
    }
  }
};

template<size_t bit_width>
const char* PostCheck<bit_width>::bad = "Bad TV file";

template<size_t bit_width>
const char* PostCheck<bit_width>::err = "Error on TV file";
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  ps_mprj_in_depth = 0;
  ps_mprj_out_depth = 0;
  ps_mprj_en_depth = 0;
  mprj_in_depth = 0;
  mprj_out_depth = 0;
  mprj_en_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{ps_mprj_in " << ps_mprj_in_depth << "}\n";
  total_list << "{ps_mprj_out " << ps_mprj_out_depth << "}\n";
  total_list << "{ps_mprj_en " << ps_mprj_en_depth << "}\n";
  total_list << "{mprj_in " << mprj_in_depth << "}\n";
  total_list << "{mprj_out " << mprj_out_depth << "}\n";
  total_list << "{mprj_en " << mprj_en_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int ps_mprj_in_depth;
    int ps_mprj_out_depth;
    int ps_mprj_en_depth;
    int mprj_in_depth;
    int mprj_out_depth;
    int mprj_en_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


struct __cosim_s8__ { char data[8]; };
extern "C" void caravel_ps_hw_stub_wrapper(__cosim_s8__*, volatile void *, volatile void *, volatile void *, __cosim_s8__*, __cosim_s8__*);

extern "C" void apatb_caravel_ps_hw(__cosim_s8__* __xlx_apatb_param_ps_mprj_in, volatile void * __xlx_apatb_param_ps_mprj_out, volatile void * __xlx_apatb_param_ps_mprj_en, volatile void * __xlx_apatb_param_mprj_in, __cosim_s8__* __xlx_apatb_param_mprj_out, __cosim_s8__* __xlx_apatb_param_mprj_en) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_ps_mprj_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<38> > ps_mprj_out_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              ps_mprj_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "ps_mprj_out" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_ps_mprj_out)[0*5+0] = ps_mprj_out_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_ps_mprj_out)[0*5+1] = ps_mprj_out_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_ps_mprj_out)[0*5+2] = ps_mprj_out_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_ps_mprj_out)[0*5+3] = ps_mprj_out_pc_buffer[0].range(31, 24).to_int64();
((char*)__xlx_apatb_param_ps_mprj_out)[0*5+4] = ps_mprj_out_pc_buffer[0].range(37, 32).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_ps_mprj_en);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<38> > ps_mprj_en_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              ps_mprj_en_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "ps_mprj_en" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_ps_mprj_en)[0*5+0] = ps_mprj_en_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_ps_mprj_en)[0*5+1] = ps_mprj_en_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_ps_mprj_en)[0*5+2] = ps_mprj_en_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_ps_mprj_en)[0*5+3] = ps_mprj_en_pc_buffer[0].range(31, 24).to_int64();
((char*)__xlx_apatb_param_ps_mprj_en)[0*5+4] = ps_mprj_en_pc_buffer[0].range(37, 32).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_mprj_in);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<38> > mprj_in_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              mprj_in_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "mprj_in" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_mprj_in)[0*5+0] = mprj_in_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_mprj_in)[0*5+1] = mprj_in_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_mprj_in)[0*5+2] = mprj_in_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_mprj_in)[0*5+3] = mprj_in_pc_buffer[0].range(31, 24).to_int64();
((char*)__xlx_apatb_param_mprj_in)[0*5+4] = mprj_in_pc_buffer[0].range(37, 32).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
CodeState = DUMP_INPUTS;
// print ps_mprj_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_ps_mprj_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ps_mprj_in;
aesl_fh.write(AUTOTB_TVIN_ps_mprj_in, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.ps_mprj_in_depth);
aesl_fh.write(AUTOTB_TVIN_ps_mprj_in, end_str());
}

// print ps_mprj_out Transactions
{
aesl_fh.write(AUTOTB_TVIN_ps_mprj_out, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ps_mprj_out;
aesl_fh.write(AUTOTB_TVIN_ps_mprj_out, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.ps_mprj_out_depth);
aesl_fh.write(AUTOTB_TVIN_ps_mprj_out, end_str());
}

// print ps_mprj_en Transactions
{
aesl_fh.write(AUTOTB_TVIN_ps_mprj_en, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ps_mprj_en;
aesl_fh.write(AUTOTB_TVIN_ps_mprj_en, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.ps_mprj_en_depth);
aesl_fh.write(AUTOTB_TVIN_ps_mprj_en, end_str());
}

// print mprj_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_mprj_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_mprj_in;
aesl_fh.write(AUTOTB_TVIN_mprj_in, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.mprj_in_depth);
aesl_fh.write(AUTOTB_TVIN_mprj_in, end_str());
}

// print mprj_out Transactions
{
aesl_fh.write(AUTOTB_TVIN_mprj_out, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_mprj_out;
aesl_fh.write(AUTOTB_TVIN_mprj_out, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.mprj_out_depth);
aesl_fh.write(AUTOTB_TVIN_mprj_out, end_str());
}

// print mprj_en Transactions
{
aesl_fh.write(AUTOTB_TVIN_mprj_en, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_mprj_en;
aesl_fh.write(AUTOTB_TVIN_mprj_en, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.mprj_en_depth);
aesl_fh.write(AUTOTB_TVIN_mprj_en, end_str());
}

CodeState = CALL_C_DUT;
caravel_ps_hw_stub_wrapper(__xlx_apatb_param_ps_mprj_in, __xlx_apatb_param_ps_mprj_out, __xlx_apatb_param_ps_mprj_en, __xlx_apatb_param_mprj_in, __xlx_apatb_param_mprj_out, __xlx_apatb_param_mprj_en);
CodeState = DUMP_OUTPUTS;
// print ps_mprj_out Transactions
{
aesl_fh.write(AUTOTB_TVOUT_ps_mprj_out, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ps_mprj_out;
aesl_fh.write(AUTOTB_TVOUT_ps_mprj_out, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.ps_mprj_out_depth);
aesl_fh.write(AUTOTB_TVOUT_ps_mprj_out, end_str());
}

// print ps_mprj_en Transactions
{
aesl_fh.write(AUTOTB_TVOUT_ps_mprj_en, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ps_mprj_en;
aesl_fh.write(AUTOTB_TVOUT_ps_mprj_en, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.ps_mprj_en_depth);
aesl_fh.write(AUTOTB_TVOUT_ps_mprj_en, end_str());
}

// print mprj_in Transactions
{
aesl_fh.write(AUTOTB_TVOUT_mprj_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_mprj_in;
aesl_fh.write(AUTOTB_TVOUT_mprj_in, formatData(pos, 38));
}
  tcl_file.set_num(1, &tcl_file.mprj_in_depth);
aesl_fh.write(AUTOTB_TVOUT_mprj_in, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
