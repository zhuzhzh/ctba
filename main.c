#include <stdio.h>


int main() {
	int addrArray[64];
	int addrLen;
	FILE* fh;
	int a;
	int anum=0;
	fh = fopen("config.txt", "r");
	if(fh==NULL) {
		printf("cannot open file config.txt!\n");
		exit(1);
	}
	while((fscanf(fh, "%x", &a)==1) && (anum<=64)) {
		printf("%d = %#x\n", anum, a);
		addrArray[anum] = a;
		anum++;
	}
	addrLen = anum;
	fclose(fh);
	return anum;
}

