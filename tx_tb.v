`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2023 02:04:12 PM
// Design Name: 
// Module Name: ALU_TEST
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module TX_IEEE_tb();
reg clk, reset_n;
wire tx;

TX_IEEE uut(
.clk(clk),
.reset_n(reset_n),
.tx(tx)
);


always
begin
clk = 1'b1;
#5
clk = 1'b0;
#5;
end

initial 
begin
reset_n = 1'b0;
#10
reset_n = 1'b1;
#10000
$stop;
end
endmodule



