//
// Created by         : Harris Zhu
// Filename           : dut.v
// Author             : Harris Zhu
// Created On         : 2016-11-15 20:38
// Last Modified      : 
// Update Count       : 2016-11-15 20:38
// Tags               :  
// Description        : 
// Conclusion         : 
//                      
//=======================================================================

module dut;

parameter DWIDTH0 = 32;
parameter DWIDTH1 = 16;
parameter DWIDTH2 = 64;

parameter AWIDTH0 = 10;
parameter AWIDTH1 = 14;
parameter AWIDTH2 = 16;


reg [AWIDTH0-1:0] addr0;
reg [AWIDTH1-1:0] addr1;
reg [AWIDTH2-1:0] addr2;

wire [DWIDTH0-1:0] dout0;
wire [DWIDTH1-1:0] dout1;
wire [DWIDTH2-1:0] dout2;

reg [DWIDTH0-1:0] din0;
reg [DWIDTH1-1:0] din1;
reg [DWIDTH2-1:0] din2;

wire clk0;
wire clk1;
wire clk2;

reg rstn=0;

reg ce0=1;
reg ce1=1;
reg ce2=1;

reg we0=0;
reg we1=0;
reg we2=0;

reg [31:0] cnt0=0;
reg [27:0] cnt1=0;
reg [15:0] cnt2=0;

dutmem0 #(DWIDTH0, AWIDTH0) u_mem0(clk0, rstn, ce0, we0, addr0, din0, dout0);
dutmem1 #(DWIDTH1, AWIDTH1) u_mem1(clk1, rstn, ce1, we1, addr1, din1, dout1);
dutmem2 #(DWIDTH2, AWIDTH2) u_mem2(clk2, rstn, ce2, we2, addr2, din2, dout2);

initial
begin
	#10;
	rstn=1;
end

always @(posedge clk0)
begin
	cnt0 <= cnt0 + 1;
	if(cnt0 % 17 == 0)
	begin
		we0 <= 1;
	end else if(cnt0 % 33 == 0)
	begin
		we0 <= 0;
	end
end


always @(posedge clk1)
begin
	cnt1 <= cnt1 + 1;
	if(cnt1 % 19 == 0)
	begin
		we1 <= 1;
	end else if(cnt1 % 37 == 0)
	begin
		we1 <= 0;
	end
end


always @(posedge clk2)
begin
	cnt2 <= cnt2 + 1;
	if(cnt2 % 23 == 0)
	begin
		we2 <= 1;
	end else if(cnt2 % 47 == 0)
	begin
		we2 <= 0;
	end
end

endmodule
