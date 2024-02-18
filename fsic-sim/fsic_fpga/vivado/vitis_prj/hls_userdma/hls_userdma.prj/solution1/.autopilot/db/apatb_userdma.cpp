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
#define AUTOTB_TVIN_inStreamTop_V_data_V "../tv/cdatafile/c.userdma.autotvin_inStreamTop_V_data_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_data_V "../tv/cdatafile/c.userdma.autotvout_inStreamTop_V_data_V.dat"
#define AUTOTB_TVIN_inStreamTop_V_keep_V "../tv/cdatafile/c.userdma.autotvin_inStreamTop_V_keep_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_keep_V "../tv/cdatafile/c.userdma.autotvout_inStreamTop_V_keep_V.dat"
#define AUTOTB_TVIN_inStreamTop_V_strb_V "../tv/cdatafile/c.userdma.autotvin_inStreamTop_V_strb_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_strb_V "../tv/cdatafile/c.userdma.autotvout_inStreamTop_V_strb_V.dat"
#define AUTOTB_TVIN_inStreamTop_V_user_V "../tv/cdatafile/c.userdma.autotvin_inStreamTop_V_user_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_user_V "../tv/cdatafile/c.userdma.autotvout_inStreamTop_V_user_V.dat"
#define AUTOTB_TVIN_inStreamTop_V_last_V "../tv/cdatafile/c.userdma.autotvin_inStreamTop_V_last_V.dat"
#define AUTOTB_TVOUT_inStreamTop_V_last_V "../tv/cdatafile/c.userdma.autotvout_inStreamTop_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V "../tv/stream_size/stream_size_in_inStreamTop_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V "../tv/stream_size/stream_size_in_inStreamTop_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V "../tv/stream_size/stream_size_in_inStreamTop_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_user_V "../tv/stream_size/stream_size_in_inStreamTop_V_user_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_user_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_user_V.dat"
#define WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V "../tv/stream_size/stream_size_in_inStreamTop_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V "../tv/stream_size/stream_ingress_status_inStreamTop_V_last_V.dat"
#define AUTOTB_TVIN_s2m_buf_sts "../tv/cdatafile/c.userdma.autotvin_s2m_buf_sts.dat"
#define AUTOTB_TVOUT_s2m_buf_sts "../tv/cdatafile/c.userdma.autotvout_s2m_buf_sts.dat"
#define AUTOTB_TVIN_s2m_sts_clear "../tv/cdatafile/c.userdma.autotvin_s2m_sts_clear.dat"
#define AUTOTB_TVOUT_s2m_sts_clear "../tv/cdatafile/c.userdma.autotvout_s2m_sts_clear.dat"
#define AUTOTB_TVIN_s2m_len "../tv/cdatafile/c.userdma.autotvin_s2m_len.dat"
#define AUTOTB_TVOUT_s2m_len "../tv/cdatafile/c.userdma.autotvout_s2m_len.dat"
#define AUTOTB_TVIN_s2m_enb_clrsts "../tv/cdatafile/c.userdma.autotvin_s2m_enb_clrsts.dat"
#define AUTOTB_TVOUT_s2m_enb_clrsts "../tv/cdatafile/c.userdma.autotvout_s2m_enb_clrsts.dat"
#define AUTOTB_TVIN_s2mbuf "../tv/cdatafile/c.userdma.autotvin_s2mbuf.dat"
#define AUTOTB_TVOUT_s2mbuf "../tv/cdatafile/c.userdma.autotvout_s2mbuf.dat"
#define AUTOTB_TVIN_s2m_err "../tv/cdatafile/c.userdma.autotvin_s2m_err.dat"
#define AUTOTB_TVOUT_s2m_err "../tv/cdatafile/c.userdma.autotvout_s2m_err.dat"
#define AUTOTB_TVIN_Img_width "../tv/cdatafile/c.userdma.autotvin_Img_width.dat"
#define AUTOTB_TVOUT_Img_width "../tv/cdatafile/c.userdma.autotvout_Img_width.dat"
#define AUTOTB_TVIN_m2sbuf "../tv/cdatafile/c.userdma.autotvin_m2sbuf.dat"
#define AUTOTB_TVOUT_m2sbuf "../tv/cdatafile/c.userdma.autotvout_m2sbuf.dat"
#define AUTOTB_TVIN_m2s_buf_sts "../tv/cdatafile/c.userdma.autotvin_m2s_buf_sts.dat"
#define AUTOTB_TVOUT_m2s_buf_sts "../tv/cdatafile/c.userdma.autotvout_m2s_buf_sts.dat"
#define AUTOTB_TVIN_m2s_sts_clear "../tv/cdatafile/c.userdma.autotvin_m2s_sts_clear.dat"
#define AUTOTB_TVOUT_m2s_sts_clear "../tv/cdatafile/c.userdma.autotvout_m2s_sts_clear.dat"
#define AUTOTB_TVIN_m2s_len "../tv/cdatafile/c.userdma.autotvin_m2s_len.dat"
#define AUTOTB_TVOUT_m2s_len "../tv/cdatafile/c.userdma.autotvout_m2s_len.dat"
#define AUTOTB_TVIN_m2s_enb_clrsts "../tv/cdatafile/c.userdma.autotvin_m2s_enb_clrsts.dat"
#define AUTOTB_TVOUT_m2s_enb_clrsts "../tv/cdatafile/c.userdma.autotvout_m2s_enb_clrsts.dat"
#define AUTOTB_TVIN_outStreamTop_V_data_V "../tv/cdatafile/c.userdma.autotvin_outStreamTop_V_data_V.dat"
#define AUTOTB_TVOUT_outStreamTop_V_data_V "../tv/cdatafile/c.userdma.autotvout_outStreamTop_V_data_V.dat"
#define AUTOTB_TVIN_outStreamTop_V_keep_V "../tv/cdatafile/c.userdma.autotvin_outStreamTop_V_keep_V.dat"
#define AUTOTB_TVOUT_outStreamTop_V_keep_V "../tv/cdatafile/c.userdma.autotvout_outStreamTop_V_keep_V.dat"
#define AUTOTB_TVIN_outStreamTop_V_strb_V "../tv/cdatafile/c.userdma.autotvin_outStreamTop_V_strb_V.dat"
#define AUTOTB_TVOUT_outStreamTop_V_strb_V "../tv/cdatafile/c.userdma.autotvout_outStreamTop_V_strb_V.dat"
#define AUTOTB_TVIN_outStreamTop_V_user_V "../tv/cdatafile/c.userdma.autotvin_outStreamTop_V_user_V.dat"
#define AUTOTB_TVOUT_outStreamTop_V_user_V "../tv/cdatafile/c.userdma.autotvout_outStreamTop_V_user_V.dat"
#define AUTOTB_TVIN_outStreamTop_V_last_V "../tv/cdatafile/c.userdma.autotvin_outStreamTop_V_last_V.dat"
#define AUTOTB_TVOUT_outStreamTop_V_last_V "../tv/cdatafile/c.userdma.autotvout_outStreamTop_V_last_V.dat"
#define WRAPC_STREAM_SIZE_OUT_outStreamTop_V_data_V "../tv/stream_size/stream_size_out_outStreamTop_V_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_data_V "../tv/stream_size/stream_egress_status_outStreamTop_V_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_outStreamTop_V_keep_V "../tv/stream_size/stream_size_out_outStreamTop_V_keep_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_keep_V "../tv/stream_size/stream_egress_status_outStreamTop_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_OUT_outStreamTop_V_strb_V "../tv/stream_size/stream_size_out_outStreamTop_V_strb_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_strb_V "../tv/stream_size/stream_egress_status_outStreamTop_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_OUT_outStreamTop_V_user_V "../tv/stream_size/stream_size_out_outStreamTop_V_user_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_user_V "../tv/stream_size/stream_egress_status_outStreamTop_V_user_V.dat"
#define WRAPC_STREAM_SIZE_OUT_outStreamTop_V_last_V "../tv/stream_size/stream_size_out_outStreamTop_V_last_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_last_V "../tv/stream_size/stream_egress_status_outStreamTop_V_last_V.dat"
#define AUTOTB_TVIN_gmem0 "../tv/cdatafile/c.userdma.autotvin_gmem0.dat"
#define AUTOTB_TVOUT_gmem0 "../tv/cdatafile/c.userdma.autotvout_gmem0.dat"
#define AUTOTB_TVIN_gmem1 "../tv/cdatafile/c.userdma.autotvin_gmem1.dat"
#define AUTOTB_TVOUT_gmem1 "../tv/cdatafile/c.userdma.autotvout_gmem1.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_inStreamTop_V_data_V "../tv/rtldatafile/rtl.userdma.autotvout_inStreamTop_V_data_V.dat"
#define AUTOTB_TVOUT_PC_inStreamTop_V_keep_V "../tv/rtldatafile/rtl.userdma.autotvout_inStreamTop_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_inStreamTop_V_strb_V "../tv/rtldatafile/rtl.userdma.autotvout_inStreamTop_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_inStreamTop_V_user_V "../tv/rtldatafile/rtl.userdma.autotvout_inStreamTop_V_user_V.dat"
#define AUTOTB_TVOUT_PC_inStreamTop_V_last_V "../tv/rtldatafile/rtl.userdma.autotvout_inStreamTop_V_last_V.dat"
#define AUTOTB_TVOUT_PC_s2m_buf_sts "../tv/rtldatafile/rtl.userdma.autotvout_s2m_buf_sts.dat"
#define AUTOTB_TVOUT_PC_s2m_sts_clear "../tv/rtldatafile/rtl.userdma.autotvout_s2m_sts_clear.dat"
#define AUTOTB_TVOUT_PC_s2m_len "../tv/rtldatafile/rtl.userdma.autotvout_s2m_len.dat"
#define AUTOTB_TVOUT_PC_s2m_enb_clrsts "../tv/rtldatafile/rtl.userdma.autotvout_s2m_enb_clrsts.dat"
#define AUTOTB_TVOUT_PC_s2mbuf "../tv/rtldatafile/rtl.userdma.autotvout_s2mbuf.dat"
#define AUTOTB_TVOUT_PC_s2m_err "../tv/rtldatafile/rtl.userdma.autotvout_s2m_err.dat"
#define AUTOTB_TVOUT_PC_Img_width "../tv/rtldatafile/rtl.userdma.autotvout_Img_width.dat"
#define AUTOTB_TVOUT_PC_m2sbuf "../tv/rtldatafile/rtl.userdma.autotvout_m2sbuf.dat"
#define AUTOTB_TVOUT_PC_m2s_buf_sts "../tv/rtldatafile/rtl.userdma.autotvout_m2s_buf_sts.dat"
#define AUTOTB_TVOUT_PC_m2s_sts_clear "../tv/rtldatafile/rtl.userdma.autotvout_m2s_sts_clear.dat"
#define AUTOTB_TVOUT_PC_m2s_len "../tv/rtldatafile/rtl.userdma.autotvout_m2s_len.dat"
#define AUTOTB_TVOUT_PC_m2s_enb_clrsts "../tv/rtldatafile/rtl.userdma.autotvout_m2s_enb_clrsts.dat"
#define AUTOTB_TVOUT_PC_outStreamTop_V_data_V "../tv/rtldatafile/rtl.userdma.autotvout_outStreamTop_V_data_V.dat"
#define AUTOTB_TVOUT_PC_outStreamTop_V_keep_V "../tv/rtldatafile/rtl.userdma.autotvout_outStreamTop_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_outStreamTop_V_strb_V "../tv/rtldatafile/rtl.userdma.autotvout_outStreamTop_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_outStreamTop_V_user_V "../tv/rtldatafile/rtl.userdma.autotvout_outStreamTop_V_user_V.dat"
#define AUTOTB_TVOUT_PC_outStreamTop_V_last_V "../tv/rtldatafile/rtl.userdma.autotvout_outStreamTop_V_last_V.dat"
#define AUTOTB_TVOUT_PC_gmem0 "../tv/rtldatafile/rtl.userdma.autotvout_gmem0.dat"
#define AUTOTB_TVOUT_PC_gmem1 "../tv/rtldatafile/rtl.userdma.autotvout_gmem1.dat"


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
  inStreamTop_V_data_V_depth = 0;
  inStreamTop_V_keep_V_depth = 0;
  inStreamTop_V_strb_V_depth = 0;
  inStreamTop_V_user_V_depth = 0;
  inStreamTop_V_last_V_depth = 0;
  s2m_buf_sts_depth = 0;
  s2m_sts_clear_depth = 0;
  s2m_len_depth = 0;
  s2m_enb_clrsts_depth = 0;
  s2mbuf_depth = 0;
  s2m_err_depth = 0;
  Img_width_depth = 0;
  m2sbuf_depth = 0;
  m2s_buf_sts_depth = 0;
  m2s_sts_clear_depth = 0;
  m2s_len_depth = 0;
  m2s_enb_clrsts_depth = 0;
  outStreamTop_V_data_V_depth = 0;
  outStreamTop_V_keep_V_depth = 0;
  outStreamTop_V_strb_V_depth = 0;
  outStreamTop_V_user_V_depth = 0;
  outStreamTop_V_last_V_depth = 0;
  gmem0_depth = 0;
  gmem1_depth = 0;
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
  total_list << "{inStreamTop_V_data_V " << inStreamTop_V_data_V_depth << "}\n";
  total_list << "{inStreamTop_V_keep_V " << inStreamTop_V_keep_V_depth << "}\n";
  total_list << "{inStreamTop_V_strb_V " << inStreamTop_V_strb_V_depth << "}\n";
  total_list << "{inStreamTop_V_user_V " << inStreamTop_V_user_V_depth << "}\n";
  total_list << "{inStreamTop_V_last_V " << inStreamTop_V_last_V_depth << "}\n";
  total_list << "{s2m_buf_sts " << s2m_buf_sts_depth << "}\n";
  total_list << "{s2m_sts_clear " << s2m_sts_clear_depth << "}\n";
  total_list << "{s2m_len " << s2m_len_depth << "}\n";
  total_list << "{s2m_enb_clrsts " << s2m_enb_clrsts_depth << "}\n";
  total_list << "{s2mbuf " << s2mbuf_depth << "}\n";
  total_list << "{s2m_err " << s2m_err_depth << "}\n";
  total_list << "{Img_width " << Img_width_depth << "}\n";
  total_list << "{m2sbuf " << m2sbuf_depth << "}\n";
  total_list << "{m2s_buf_sts " << m2s_buf_sts_depth << "}\n";
  total_list << "{m2s_sts_clear " << m2s_sts_clear_depth << "}\n";
  total_list << "{m2s_len " << m2s_len_depth << "}\n";
  total_list << "{m2s_enb_clrsts " << m2s_enb_clrsts_depth << "}\n";
  total_list << "{outStreamTop_V_data_V " << outStreamTop_V_data_V_depth << "}\n";
  total_list << "{outStreamTop_V_keep_V " << outStreamTop_V_keep_V_depth << "}\n";
  total_list << "{outStreamTop_V_strb_V " << outStreamTop_V_strb_V_depth << "}\n";
  total_list << "{outStreamTop_V_user_V " << outStreamTop_V_user_V_depth << "}\n";
  total_list << "{outStreamTop_V_last_V " << outStreamTop_V_last_V_depth << "}\n";
  total_list << "{gmem0 " << gmem0_depth << "}\n";
  total_list << "{gmem1 " << gmem1_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int inStreamTop_V_data_V_depth;
    int inStreamTop_V_keep_V_depth;
    int inStreamTop_V_strb_V_depth;
    int inStreamTop_V_user_V_depth;
    int inStreamTop_V_last_V_depth;
    int s2m_buf_sts_depth;
    int s2m_sts_clear_depth;
    int s2m_len_depth;
    int s2m_enb_clrsts_depth;
    int s2mbuf_depth;
    int s2m_err_depth;
    int Img_width_depth;
    int m2sbuf_depth;
    int m2s_buf_sts_depth;
    int m2s_sts_clear_depth;
    int m2s_len_depth;
    int m2s_enb_clrsts_depth;
    int outStreamTop_V_data_V_depth;
    int outStreamTop_V_keep_V_depth;
    int outStreamTop_V_strb_V_depth;
    int outStreamTop_V_user_V_depth;
    int outStreamTop_V_last_V_depth;
    int gmem0_depth;
    int gmem1_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


struct __cosim_s4__ { char data[4]; };
struct __cosim_s1__ { char data[1]; };
extern "C" void userdma_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, char, __cosim_s4__*, __cosim_s1__*, volatile void *, volatile void *, __cosim_s4__*, volatile void *, volatile void *, char, int, __cosim_s1__*, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_userdma_hw(volatile void * __xlx_apatb_param_inStreamTop_V_data_V, volatile void * __xlx_apatb_param_inStreamTop_V_keep_V, volatile void * __xlx_apatb_param_inStreamTop_V_strb_V, volatile void * __xlx_apatb_param_inStreamTop_V_user_V, volatile void * __xlx_apatb_param_inStreamTop_V_last_V, volatile void * __xlx_apatb_param_s2m_buf_sts, char __xlx_apatb_param_s2m_sts_clear, __cosim_s4__* __xlx_apatb_param_s2m_len, __cosim_s1__* __xlx_apatb_param_s2m_enb_clrsts, volatile void * __xlx_apatb_param_s2mbuf, volatile void * __xlx_apatb_param_s2m_err, __cosim_s4__* __xlx_apatb_param_Img_width, volatile void * __xlx_apatb_param_m2sbuf, volatile void * __xlx_apatb_param_m2s_buf_sts, char __xlx_apatb_param_m2s_sts_clear, int __xlx_apatb_param_m2s_len, __cosim_s1__* __xlx_apatb_param_m2s_enb_clrsts, volatile void * __xlx_apatb_param_outStreamTop_V_data_V, volatile void * __xlx_apatb_param_outStreamTop_V_keep_V, volatile void * __xlx_apatb_param_outStreamTop_V_strb_V, volatile void * __xlx_apatb_param_outStreamTop_V_user_V, volatile void * __xlx_apatb_param_outStreamTop_V_last_V) {
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
long __xlx_apatb_param_inStreamTop_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V);
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
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_inStreamTop_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_inStreamTop_stream_buf_final_size; ++i) {
((hls::stream<int>*)__xlx_apatb_param_inStreamTop_V_data_V)->read();
((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->read();
((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->read();
((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_user_V)->read();
((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->read();
}
{unsigned xlx_stream_outStreamTop_size = 0;

          std::vector<sc_bv<32> > outStreamTop_V_data_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_outStreamTop_V_data_V);
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
          std::vector<sc_bv<32> > outStreamTop_V_data_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              outStreamTop_V_data_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "outStreamTop" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_outStreamTop_size=outStreamTop_V_data_V_pc_buffer.size();
outStreamTop_V_data_V_pc_buffer_Copy=outStreamTop_V_data_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<32> > outStreamTop_V_keep_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_outStreamTop_V_keep_V);
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
          std::vector<sc_bv<32> > outStreamTop_V_keep_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              outStreamTop_V_keep_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "outStreamTop" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_outStreamTop_size=outStreamTop_V_keep_V_pc_buffer.size();
outStreamTop_V_keep_V_pc_buffer_Copy=outStreamTop_V_keep_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<32> > outStreamTop_V_strb_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_outStreamTop_V_strb_V);
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
          std::vector<sc_bv<32> > outStreamTop_V_strb_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              outStreamTop_V_strb_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "outStreamTop" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_outStreamTop_size=outStreamTop_V_strb_V_pc_buffer.size();
outStreamTop_V_strb_V_pc_buffer_Copy=outStreamTop_V_strb_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<32> > outStreamTop_V_user_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_outStreamTop_V_user_V);
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
          std::vector<sc_bv<32> > outStreamTop_V_user_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              outStreamTop_V_user_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "outStreamTop" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_outStreamTop_size=outStreamTop_V_user_V_pc_buffer.size();
outStreamTop_V_user_V_pc_buffer_Copy=outStreamTop_V_user_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<32> > outStreamTop_V_last_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_outStreamTop_V_last_V);
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
          std::vector<sc_bv<32> > outStreamTop_V_last_V_pc_buffer;
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              outStreamTop_V_last_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "outStreamTop" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {xlx_stream_outStreamTop_size=outStreamTop_V_last_V_pc_buffer.size();
outStreamTop_V_last_V_pc_buffer_Copy=outStreamTop_V_last_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (int j = 0, e = xlx_stream_outStreamTop_size; j != e; ++j) {
int xlx_stream_elt_data;
((int*)&xlx_stream_elt_data)[0] = outStreamTop_V_data_V_pc_buffer_Copy[j].to_int64();
((hls::stream<int>*)__xlx_apatb_param_outStreamTop_V_data_V)->write(xlx_stream_elt_data);
char xlx_stream_elt_keep;
((char*)&xlx_stream_elt_keep)[0] = outStreamTop_V_keep_V_pc_buffer_Copy[j].to_int64();
((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_keep_V)->write(xlx_stream_elt_keep);
char xlx_stream_elt_strb;
((char*)&xlx_stream_elt_strb)[0] = outStreamTop_V_strb_V_pc_buffer_Copy[j].to_int64();
((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_strb_V)->write(xlx_stream_elt_strb);
char xlx_stream_elt_user;
((char*)&xlx_stream_elt_user)[0] = outStreamTop_V_user_V_pc_buffer_Copy[j].to_int64();
((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_user_V)->write(xlx_stream_elt_user);
char xlx_stream_elt_last;
((char*)&xlx_stream_elt_last)[0] = outStreamTop_V_last_V_pc_buffer_Copy[j].to_uint64();
((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_last_V)->write(xlx_stream_elt_last);
}}
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_s2m_buf_sts);
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
          std::vector<sc_bv<1> > s2m_buf_sts_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              s2m_buf_sts_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "s2m_buf_sts" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_s2m_buf_sts)[0*1+0] = s2m_buf_sts_pc_buffer[0].range(0, 0).to_uint64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_s2m_err);
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
          std::vector<sc_bv<1> > s2m_err_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              s2m_err_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "s2m_err" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_s2m_err)[0*1+0] = s2m_err_pc_buffer[0].range(0, 0).to_uint64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_m2s_buf_sts);
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
          std::vector<sc_bv<1> > m2s_buf_sts_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              m2s_buf_sts_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "m2s_buf_sts" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_m2s_buf_sts)[0*1+0] = m2s_buf_sts_pc_buffer[0].range(0, 0).to_uint64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #ifdef USE_BINARY_TV_FILE
{
transaction<32> tr(57600);
aesl_fh.read(AUTOTB_TVOUT_PC_gmem0, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<4>((char*)__xlx_apatb_param_s2mbuf, 57600, 0);
}
#else
try {
static PostCheck<32> pc(AUTOTB_TVOUT_PC_gmem0);
pc.psize = 4;
pc.param = (char*)__xlx_apatb_param_s2mbuf;
pc.depth = 57600;
pc.run(AESL_transaction_pc, 0);
} catch (SimException &e) {
  std::cout << "at line " << e.line << " occurred exception, " << e.msg << "\n";
}
#endif

    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_user_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_user_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_data_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_user_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_user_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_last_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_outStreamTop_V_last_V);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_s2mbuf = 0;
unsigned __xlx_offset_byte_param_m2sbuf = 0;
// data
std::vector<int> __xlx_apatb_param_inStreamTop_V_data_V_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_inStreamTop_V_data_V)->empty())
    __xlx_apatb_param_inStreamTop_V_data_V_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_inStreamTop_V_data_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_data_V_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_inStreamTop_V_data_V)->write(__xlx_apatb_param_inStreamTop_V_data_V_stream_buf[i]);
  }
long __xlx_apatb_param_inStreamTop_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_inStreamTop_V_data_V)->size();
// keep
std::vector<char> __xlx_apatb_param_inStreamTop_V_keep_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->empty())
    __xlx_apatb_param_inStreamTop_V_keep_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_keep_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_keep_V)->write(__xlx_apatb_param_inStreamTop_V_keep_V_stream_buf[i]);
  }
// strb
std::vector<char> __xlx_apatb_param_inStreamTop_V_strb_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->empty())
    __xlx_apatb_param_inStreamTop_V_strb_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_strb_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_strb_V)->write(__xlx_apatb_param_inStreamTop_V_strb_V_stream_buf[i]);
  }
// user
std::vector<char> __xlx_apatb_param_inStreamTop_V_user_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_user_V)->empty())
    __xlx_apatb_param_inStreamTop_V_user_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_user_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_user_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_user_V)->write(__xlx_apatb_param_inStreamTop_V_user_V_stream_buf[i]);
  }
// last
std::vector<char> __xlx_apatb_param_inStreamTop_V_last_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->empty())
    __xlx_apatb_param_inStreamTop_V_last_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->read());
  for (int i = 0; i < __xlx_apatb_param_inStreamTop_V_last_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_inStreamTop_V_last_V)->write(__xlx_apatb_param_inStreamTop_V_last_V_stream_buf[i]);
  }
// id
// dest
// data
std::vector<int> __xlx_apatb_param_outStreamTop_V_data_V_stream_buf;
long __xlx_apatb_param_outStreamTop_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_outStreamTop_V_data_V)->size();
// keep
std::vector<char> __xlx_apatb_param_outStreamTop_V_keep_V_stream_buf;
// strb
std::vector<char> __xlx_apatb_param_outStreamTop_V_strb_V_stream_buf;
// user
std::vector<char> __xlx_apatb_param_outStreamTop_V_user_V_stream_buf;
// last
std::vector<char> __xlx_apatb_param_outStreamTop_V_last_V_stream_buf;
// id
// dest
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_gmem0, 'b');
transaction<32> tr(57600);
__xlx_offset_byte_param_s2mbuf = 0*4;
if (__xlx_apatb_param_s2mbuf) {
  tr.import<4>((char*)__xlx_apatb_param_s2mbuf, 57600, 0);
}
aesl_fh.write(AUTOTB_TVIN_gmem0, tr.p, tr.tbytes);
tcl_file.set_num(57600, &tcl_file.gmem0_depth);
}
#else
aesl_fh.touch(AUTOTB_TVIN_gmem0);
{
aesl_fh.write(AUTOTB_TVIN_gmem0, begin_str(AESL_transaction));
__xlx_offset_byte_param_s2mbuf = 0*4;
if (__xlx_apatb_param_s2mbuf) {
for (size_t i = 0; i < 57600; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_s2mbuf + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVIN_gmem0, s);
}
}
tcl_file.set_num(57600, &tcl_file.gmem0_depth);
aesl_fh.write(AUTOTB_TVIN_gmem0, end_str());
}
#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_gmem1, 'b');
transaction<32> tr(57600);
__xlx_offset_byte_param_m2sbuf = 0*4;
if (__xlx_apatb_param_m2sbuf) {
  tr.import<4>((char*)__xlx_apatb_param_m2sbuf, 57600, 0);
}
aesl_fh.write(AUTOTB_TVIN_gmem1, tr.p, tr.tbytes);
tcl_file.set_num(57600, &tcl_file.gmem1_depth);
}
#else
aesl_fh.touch(AUTOTB_TVIN_gmem1);
{
aesl_fh.write(AUTOTB_TVIN_gmem1, begin_str(AESL_transaction));
__xlx_offset_byte_param_m2sbuf = 0*4;
if (__xlx_apatb_param_m2sbuf) {
for (size_t i = 0; i < 57600; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_m2sbuf + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVIN_gmem1, s);
}
}
tcl_file.set_num(57600, &tcl_file.gmem1_depth);
aesl_fh.write(AUTOTB_TVIN_gmem1, end_str());
}
#endif
// print s2m_buf_sts Transactions
{
aesl_fh.write(AUTOTB_TVIN_s2m_buf_sts, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_s2m_buf_sts;
aesl_fh.write(AUTOTB_TVIN_s2m_buf_sts, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.s2m_buf_sts_depth);
aesl_fh.write(AUTOTB_TVIN_s2m_buf_sts, end_str());
}

// print s2m_sts_clear Transactions
{
aesl_fh.write(AUTOTB_TVIN_s2m_sts_clear, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_apatb_param_s2m_sts_clear;
aesl_fh.write(AUTOTB_TVIN_s2m_sts_clear, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.s2m_sts_clear_depth);
aesl_fh.write(AUTOTB_TVIN_s2m_sts_clear, end_str());
}

// print s2m_len Transactions
{
aesl_fh.write(AUTOTB_TVIN_s2m_len, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_s2m_len;
aesl_fh.write(AUTOTB_TVIN_s2m_len, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.s2m_len_depth);
aesl_fh.write(AUTOTB_TVIN_s2m_len, end_str());
}

// print s2m_enb_clrsts Transactions
{
aesl_fh.write(AUTOTB_TVIN_s2m_enb_clrsts, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_s2m_enb_clrsts;
aesl_fh.write(AUTOTB_TVIN_s2m_enb_clrsts, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.s2m_enb_clrsts_depth);
aesl_fh.write(AUTOTB_TVIN_s2m_enb_clrsts, end_str());
}

// print s2mbuf Transactions
{
aesl_fh.write(AUTOTB_TVIN_s2mbuf, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_offset_byte_param_s2mbuf;
aesl_fh.write(AUTOTB_TVIN_s2mbuf, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.s2mbuf_depth);
aesl_fh.write(AUTOTB_TVIN_s2mbuf, end_str());
}

// print s2m_err Transactions
{
aesl_fh.write(AUTOTB_TVIN_s2m_err, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_s2m_err;
aesl_fh.write(AUTOTB_TVIN_s2m_err, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.s2m_err_depth);
aesl_fh.write(AUTOTB_TVIN_s2m_err, end_str());
}

// print Img_width Transactions
{
aesl_fh.write(AUTOTB_TVIN_Img_width, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_Img_width;
aesl_fh.write(AUTOTB_TVIN_Img_width, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.Img_width_depth);
aesl_fh.write(AUTOTB_TVIN_Img_width, end_str());
}

// print m2sbuf Transactions
{
aesl_fh.write(AUTOTB_TVIN_m2sbuf, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_offset_byte_param_m2sbuf;
aesl_fh.write(AUTOTB_TVIN_m2sbuf, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.m2sbuf_depth);
aesl_fh.write(AUTOTB_TVIN_m2sbuf, end_str());
}

// print m2s_buf_sts Transactions
{
aesl_fh.write(AUTOTB_TVIN_m2s_buf_sts, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_m2s_buf_sts;
aesl_fh.write(AUTOTB_TVIN_m2s_buf_sts, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.m2s_buf_sts_depth);
aesl_fh.write(AUTOTB_TVIN_m2s_buf_sts, end_str());
}

// print m2s_sts_clear Transactions
{
aesl_fh.write(AUTOTB_TVIN_m2s_sts_clear, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_apatb_param_m2s_sts_clear;
aesl_fh.write(AUTOTB_TVIN_m2s_sts_clear, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.m2s_sts_clear_depth);
aesl_fh.write(AUTOTB_TVIN_m2s_sts_clear, end_str());
}

// print m2s_len Transactions
{
aesl_fh.write(AUTOTB_TVIN_m2s_len, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_apatb_param_m2s_len;
aesl_fh.write(AUTOTB_TVIN_m2s_len, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.m2s_len_depth);
aesl_fh.write(AUTOTB_TVIN_m2s_len, end_str());
}

// print m2s_enb_clrsts Transactions
{
aesl_fh.write(AUTOTB_TVIN_m2s_enb_clrsts, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_m2s_enb_clrsts;
aesl_fh.write(AUTOTB_TVIN_m2s_enb_clrsts, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.m2s_enb_clrsts_depth);
aesl_fh.write(AUTOTB_TVIN_m2s_enb_clrsts, end_str());
}

CodeState = CALL_C_DUT;
userdma_hw_stub_wrapper(__xlx_apatb_param_inStreamTop_V_data_V, __xlx_apatb_param_inStreamTop_V_keep_V, __xlx_apatb_param_inStreamTop_V_strb_V, __xlx_apatb_param_inStreamTop_V_user_V, __xlx_apatb_param_inStreamTop_V_last_V, __xlx_apatb_param_s2m_buf_sts, __xlx_apatb_param_s2m_sts_clear, __xlx_apatb_param_s2m_len, __xlx_apatb_param_s2m_enb_clrsts, __xlx_apatb_param_s2mbuf, __xlx_apatb_param_s2m_err, __xlx_apatb_param_Img_width, __xlx_apatb_param_m2sbuf, __xlx_apatb_param_m2s_buf_sts, __xlx_apatb_param_m2s_sts_clear, __xlx_apatb_param_m2s_len, __xlx_apatb_param_m2s_enb_clrsts, __xlx_apatb_param_outStreamTop_V_data_V, __xlx_apatb_param_outStreamTop_V_keep_V, __xlx_apatb_param_outStreamTop_V_strb_V, __xlx_apatb_param_outStreamTop_V_user_V, __xlx_apatb_param_outStreamTop_V_last_V);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_inStreamTop_stream_buf_final_size = __xlx_apatb_param_inStreamTop_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_inStreamTop_V_data_V)->size();
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_data_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_keep_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_strb_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_user_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_last_V, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_inStreamTop_stream_buf_final_size; ++i) {
  std::string s;
s = formatData((unsigned char*)(__xlx_apatb_param_inStreamTop_V_data_V_stream_buf.data()+i), 32);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_data_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_inStreamTop_V_keep_V_stream_buf.data()+i), 4);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_keep_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_inStreamTop_V_strb_V_stream_buf.data()+i), 4);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_strb_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_inStreamTop_V_user_V_stream_buf.data()+i), 7);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_user_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_inStreamTop_V_last_V_stream_buf.data()+i), 1);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_last_V, s);
}
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_data_V_depth);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_data_V, end_str());
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_keep_V_depth);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_keep_V, end_str());
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_strb_V_depth);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_strb_V, end_str());
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_user_V_depth);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_user_V, end_str());
tcl_file.set_num(__xlx_apatb_param_inStreamTop_stream_buf_final_size, &tcl_file.inStreamTop_V_last_V_depth);
aesl_fh.write(AUTOTB_TVIN_inStreamTop_V_last_V, end_str());

// dump stream ingress status to file

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_data_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_data_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_keep_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_keep_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_strb_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_strb_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_strb_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_strb_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_user_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_user_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_user_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_user_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_user_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_user_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_user_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_user_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_user_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_user_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_user_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_inStreamTop_stream_buf_final_size > 0) {
  long inStreamTop_V_last_V_stream_ingress_size = __xlx_apatb_param_inStreamTop_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_inStreamTop_stream_buf_final_size; j != e; j++) {
    inStreamTop_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long inStreamTop_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", inStreamTop_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_inStreamTop_V_last_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_data_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_keep_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_strb_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_user_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_user_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_user_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_inStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_inStreamTop_V_last_V, end_str());
}

//********************** dump C output stream *******************
long __xlx_apatb_param_outStreamTop_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_outStreamTop_V_data_V)->size() - __xlx_apatb_param_outStreamTop_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_outStreamTop_V_data_V)->empty())
    __xlx_apatb_param_outStreamTop_V_data_V_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_outStreamTop_V_data_V)->read());
  for (int i = 0; i < __xlx_apatb_param_outStreamTop_V_data_V_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_outStreamTop_V_data_V)->write(__xlx_apatb_param_outStreamTop_V_data_V_stream_buf[i]);
  }
{
  while (!((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_keep_V)->empty())
    __xlx_apatb_param_outStreamTop_V_keep_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_keep_V)->read());
  for (int i = 0; i < __xlx_apatb_param_outStreamTop_V_keep_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_keep_V)->write(__xlx_apatb_param_outStreamTop_V_keep_V_stream_buf[i]);
  }
{
  while (!((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_strb_V)->empty())
    __xlx_apatb_param_outStreamTop_V_strb_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_strb_V)->read());
  for (int i = 0; i < __xlx_apatb_param_outStreamTop_V_strb_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_strb_V)->write(__xlx_apatb_param_outStreamTop_V_strb_V_stream_buf[i]);
  }
{
  while (!((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_user_V)->empty())
    __xlx_apatb_param_outStreamTop_V_user_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_user_V)->read());
  for (int i = 0; i < __xlx_apatb_param_outStreamTop_V_user_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_user_V)->write(__xlx_apatb_param_outStreamTop_V_user_V_stream_buf[i]);
  }
{
  while (!((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_last_V)->empty())
    __xlx_apatb_param_outStreamTop_V_last_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_last_V)->read());
  for (int i = 0; i < __xlx_apatb_param_outStreamTop_V_last_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_outStreamTop_V_last_V)->write(__xlx_apatb_param_outStreamTop_V_last_V_stream_buf[i]);
  }
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_data_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_keep_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_strb_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_user_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_last_V, begin_str(AESL_transaction));
for (int i = 0; i < __xlx_apatb_param_outStreamTop_stream_buf_final_size; ++i) {
  std::string s;
s = formatData((unsigned char*)(__xlx_apatb_param_outStreamTop_V_data_V_stream_buf.data()+__xlx_apatb_param_outStreamTop_stream_buf_size+i), 32);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_data_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_outStreamTop_V_keep_V_stream_buf.data()+__xlx_apatb_param_outStreamTop_stream_buf_size+i), 4);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_keep_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_outStreamTop_V_strb_V_stream_buf.data()+__xlx_apatb_param_outStreamTop_stream_buf_size+i), 4);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_strb_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_outStreamTop_V_user_V_stream_buf.data()+__xlx_apatb_param_outStreamTop_stream_buf_size+i), 7);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_user_V, s);
s = formatData((unsigned char*)(__xlx_apatb_param_outStreamTop_V_last_V_stream_buf.data()+__xlx_apatb_param_outStreamTop_stream_buf_size+i), 1);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_last_V, s);
}
tcl_file.set_num(__xlx_apatb_param_outStreamTop_stream_buf_final_size, &tcl_file.outStreamTop_V_data_V_depth);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_data_V, end_str());
tcl_file.set_num(__xlx_apatb_param_outStreamTop_stream_buf_final_size, &tcl_file.outStreamTop_V_keep_V_depth);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_keep_V, end_str());
tcl_file.set_num(__xlx_apatb_param_outStreamTop_stream_buf_final_size, &tcl_file.outStreamTop_V_strb_V_depth);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_strb_V, end_str());
tcl_file.set_num(__xlx_apatb_param_outStreamTop_stream_buf_final_size, &tcl_file.outStreamTop_V_user_V_depth);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_user_V, end_str());
tcl_file.set_num(__xlx_apatb_param_outStreamTop_stream_buf_final_size, &tcl_file.outStreamTop_V_last_V_depth);
aesl_fh.write(AUTOTB_TVOUT_outStreamTop_V_last_V, end_str());
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_data_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_outStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_data_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_data_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_keep_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_outStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_keep_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_keep_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_strb_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_outStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_strb_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_strb_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_user_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_outStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_user_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_user_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_last_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_outStreamTop_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_last_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_OUT_outStreamTop_V_last_V, end_str());
}
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_gmem0, 'b');
transaction<32> tr(57600);
__xlx_offset_byte_param_s2mbuf = 0*4;
if (__xlx_apatb_param_s2mbuf) {
  tr.import<4>((char*)__xlx_apatb_param_s2mbuf, 57600, 0);
}
aesl_fh.write(AUTOTB_TVOUT_gmem0, tr.p, tr.tbytes);
tcl_file.set_num(57600, &tcl_file.gmem0_depth);
}
#else
aesl_fh.touch(AUTOTB_TVOUT_gmem0);
{
aesl_fh.write(AUTOTB_TVOUT_gmem0, begin_str(AESL_transaction));
__xlx_offset_byte_param_s2mbuf = 0*4;
if (__xlx_apatb_param_s2mbuf) {
for (size_t i = 0; i < 57600; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_s2mbuf + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVOUT_gmem0, s);
}
}
tcl_file.set_num(57600, &tcl_file.gmem0_depth);
aesl_fh.write(AUTOTB_TVOUT_gmem0, end_str());
}
#endif
// print s2m_buf_sts Transactions
{
aesl_fh.write(AUTOTB_TVOUT_s2m_buf_sts, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_s2m_buf_sts;
aesl_fh.write(AUTOTB_TVOUT_s2m_buf_sts, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.s2m_buf_sts_depth);
aesl_fh.write(AUTOTB_TVOUT_s2m_buf_sts, end_str());
}

// print s2m_err Transactions
{
aesl_fh.write(AUTOTB_TVOUT_s2m_err, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_s2m_err;
aesl_fh.write(AUTOTB_TVOUT_s2m_err, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.s2m_err_depth);
aesl_fh.write(AUTOTB_TVOUT_s2m_err, end_str());
}

// print m2s_buf_sts Transactions
{
aesl_fh.write(AUTOTB_TVOUT_m2s_buf_sts, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_m2s_buf_sts;
aesl_fh.write(AUTOTB_TVOUT_m2s_buf_sts, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.m2s_buf_sts_depth);
aesl_fh.write(AUTOTB_TVOUT_m2s_buf_sts, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
