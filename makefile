defaut: sa



libdpi:
	gcc -o libdpi.so -g -shared -fPIC libdpi.c -I${IES_HOME}/tools.lnx86/include -I${UXE_HOME}/share/uxe/etc/ixcom

sa: vlan ixcom irun


simc:
	irun -64bit -f dut.f  -access rwc -linedebug -vtimescale 1ns/1ps -elaborate

simrun:
	irun -gui -64bit -sv_lib ./libdpi.so -R -input sim.i

clean:
	rm -rf work QTDB PDB dbFiles *.log *.msg *.history *.so *.key

PHONY: clean
