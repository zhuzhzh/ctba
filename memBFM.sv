//
// Created by         : Harris Zhu
// Filename           : memBFM.sv
// Author             : Harris Zhu
// Created On         : 2016-11-15 20:21
// Last Modified      : 
// Update Count       : 2016-11-15 20:21
// Tags               :  
// Description        : 
// Conclusion         : 
//                      
//=======================================================================

`define MEMPATH0 hw_top.u_dut.u_mem0
`define MEMPATH1 hw_top.u_dut.u_mem1
`define MEMPATH2 hw_top.u_dut.u_mem2

`define ADDR0 10'h0f0
`define ADDR1 14'h0f0f
`define ADDR2 16'he0ff

module memBFM;

parameter DWIDTH = 32;
parameter AWIDTH = 32;
parameter ANUMBIT = 6;
parameter ANUM = (1<<ANUMBIT);
parameter ADEPTH = (1<<AWIDTH);

import "DPI-C" context function int getConfig(output bit [AWIDTH-1:0] addrArray [0:ANUM-1], output byte addrLen);

import "DPI-C" context function void trekFunc0(input bit [DWIDTH-1:0] data);
import "DPI-C" context function void trekFunc1(input bit [DWIDTH-1:0] data);
import "DPI-C" context function void trekFunc2(input bit [DWIDTH-1:0] data);

wire clk = hw_top.u_clkgen.clk1;

reg [AWIDTH-1:0] addrArray [0:ANUM-1];
reg [7:0] addrLen;
reg trigMem0;
reg trigMem1;
reg trigMem2;

initial
begin
	getConfig(addrArray, addrLen);
end



always @(posedge clk)
begin
	if(addrLen>=1)
	begin
		if(`MEMPATH0.ce && `MEMPATH0.we && (`MEMPATH0.addr == addrArray[0]))
		begin
			trigMem0 <= 1;
			trekFunc0(`MEMPATH0.mem[`ADDR0]);
		end else begin
			trigMem0 <= 0;
		end
	end
end

always @(posedge clk)
begin
	if(addrLen>=2)
	begin
		if(`MEMPATH1.ce && `MEMPATH1.we && (`MEMPATH1.addr == addrArray[1]))
		begin
			trigMem1 <= 1;
			trekFunc1(`MEMPATH1.mem[`ADDR1]);
		end else begin
			trigMem1 <= 0;
		end
	end
end

always @(posedge clk)
begin
	if(addrLen>=3)
	begin
		if(`MEMPATH2.ce && `MEMPATH2.we && (`MEMPATH2.addr == addrArray[2]))
		begin
			trigMem2 <= 1;
			trekFunc2(`MEMPATH2.mem[`ADDR2]);
		end else begin
			trigMem2 <= 0;
		end
	end
end

endmodule
