#include <iostream>

using namespace std;

#define CODE_SIZE   1024*4

void read_romcode(
// PS side interace
    int romcode[CODE_SIZE/sizeof(int)],
	int internal_bram[CODE_SIZE/sizeof(int)],
	int romcode_to_PS[CODE_SIZE/sizeof(int)],
	int cmd  //0: load program.hex from romcode to BRAM
			 //1: read program back from BRAM to romcode_to_PS

);

int main() {
    int romcode[CODE_SIZE/sizeof(int)];
    int internal_bram[CODE_SIZE/sizeof(int)];
    int romcode_to_PS[CODE_SIZE/sizeof(int)];

    for(int i=0; i<CODE_SIZE/sizeof(int); i++){
    	romcode[i] = i;  //init romcode
    	internal_bram[i] = 0;  //init internal_bram
    	romcode_to_PS[i] = 1;  //init romcode_to_PS
    }

    read_romcode(romcode, internal_bram, romcode_to_PS, 0);  //load to BRAM

    bool load_pass = true;
    for(int i=0; i<CODE_SIZE/sizeof(int); i++){
    	if(romcode[i] != internal_bram[i]){
    		cout<<i<<" mismatch, internal_bram: "<<internal_bram[i]<<endl;
    		load_pass = false;
    	}
    }
    if(load_pass){
    	cout<<"load to BRAM pass\n";
    }else{
    	cout<<"load to BRAM fail\n";
    }

    read_romcode(romcode, internal_bram, romcode_to_PS, 1);  //read back from BRAM

    bool read_back_pass = true;
    for(int i=0; i<CODE_SIZE/sizeof(int); i++){
    	if(romcode[i] != romcode_to_PS[i]){
    		cout<<i<<" mismatch, romcode_to_PS: "<<romcode_to_PS[i]<<endl;
    		read_back_pass = false;
    	}
    }
    if(read_back_pass){
    	cout<<"read back pass\n";
    }else{
    	cout<<"read back fail\n";
    }


    return 0;
}
