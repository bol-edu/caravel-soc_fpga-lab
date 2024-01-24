#ifndef _MATMUL_H
#define _MATMUL_H

#define MM_SIZE 4
///////////////////////////////// Added /////////////////////////////////
#define MM_BASE_ADDRESS 0x30010000
/////////////////////////////////////////////////////////////////////////
	int A[MM_SIZE*MM_SIZE] = {0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
	};
	int B[MM_SIZE*MM_SIZE] = {1, 2, 3, 4,
		5, 6, 7, 8,
		9, 10, 11, 12,
		13, 14, 15, 16,
	};
	//////////int result[MM_SIZE*MM_SIZE];
#endif
