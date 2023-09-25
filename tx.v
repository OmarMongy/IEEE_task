`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 10:21:50 PM
// Design Name: 
// Module Name: rca_4bit
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
module mux(
input [9:0] inp,
input [3:0] sel,
output reg out
);

always @(*)
begin
  case(sel)
    4'b0000 : out = inp[0];
    4'b0001 : out = inp[1];
    4'b0010 : out = inp[2];
    4'b0011 : out = inp[3];
    4'b0100 : out = inp[4];
    4'b0101 : out = inp[5];
    4'b0110 : out = inp[6];
    4'b0111 : out = inp[7];
    4'b1000 : out = inp[8];
    4'b1001 : out = inp[9];
    4'b1010 : out = inp[10];
  endcase     
end 
endmodule

module mod_counter_parameter
    #(parameter FINAL_VALUE = 9,n = 4)(//Final value is inclusive
    input clk,
    input reset_n,
    output [n - 1:0] count,
    output tick
    
    );
    reg [n - 1:0] count_reg, count_next;
    wire done;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            count_reg <= 'b0;
        else
            count_reg <= count_next;
    end
    
    // Next state logic
    assign done = count_reg == FINAL_VALUE;

    always @(*)
        count_next = done? 'b0: count_reg + 1;
    
    // Output logic
    assign tick = count_reg == FINAL_VALUE;
    assign count = count_reg;
endmodule




//////////////////////////////////////////////////////

module TX_IEEE(
input clk, reset_n,
output reg tx
);
wire [9:0] data;
wire w;
wire ena;
wire [3:0] sel;
wire [7:0] in;
always@(posedge clk, negedge reset_n)
begin
if(!reset_n)
 tx <= 0;
else
 tx <= w;
end 

assign data = {1'b0, in[7:0], 1'b1};
mux U0(
.inp(data),
.sel(sel),
.out(w)
);

mod_counter_parameter  #(.FINAL_VALUE(255),.n(8)) U1(
.clk(ena),
.reset_n(reset_n),
.tick(),
.count(in)
);

mod_counter_parameter  #(.FINAL_VALUE(9),.n(4)) U2(
.clk(clk),
.reset_n(reset_n),
.tick(ena),
.count(sel)
);
 
endmodule
