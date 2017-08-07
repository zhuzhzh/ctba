//
// Created by         : Harris Zhu
// Filename           : clkgen.sv
// Author             : Harris Zhu
// Created On         : 2016-11-15 20:36
// Last Modified      : 
// Update Count       : 2016-11-15 20:36
// Tags               :  
// Description        : 
// Conclusion         : 
//                      
//=======================================================================

module clkgen;

reg clk0=0;
reg clk1=0;
reg clk2=0;

always #1 clk0 = ~clk0;
always #2 clk1 = ~clk1;
always #3 clk2 = ~clk2;

initial
begin
	force hw_top.u_dut.clk0 = clk0;
	force hw_top.u_dut.clk1 = clk1;
	force hw_top.u_dut.clk2 = clk2;
end

endmodule

