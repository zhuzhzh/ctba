#include <stdio.h>
#include <svdpi.h>

void getMem(int addr, int* data);

int getConfig(int * addrArray, char* addrLen) {
	FILE* fh;
	int a;
	int anum=0;
	fh = fopen("config.txt", "r");
	if(fh==NULL) {
		printf("cannot open file config.txt!\n");
		exit(1);
	}
	while((fscanf(fh, "%x", &a)==1) && (anum<=64)) {
		addrArray[anum] = a;
		anum++;
	}
	*addrLen = anum;
	fclose(fh);
	return anum;
}

void trekFunc0(int data) {
	int dataArray[2];
	getMem(0x0000ffff, dataArray);
}

void trekFunc1(int data) {
	int dataArray[2];
	getMem(0x0000fff0, dataArray);
}

void trekFunc2(int data) {
	int dataArray[2];
	getMem(0x0000ff00, dataArray);
}

void getMem(int addr, int* data) {
	switch (addr)
	{
	case 0x0000ffff:
		data[0] = 0;
		data[0] = 1;
		break;
	case 0x0000fff0:
		data[0] = 2;
		data[0] = 3;
		break;
	case 0x0000ff00:
		data[0] = 4;
		data[0] = 5;
		break;
	default:
		data[0] = 6;
		data[0] = 7;
		break;
	}
		
}
