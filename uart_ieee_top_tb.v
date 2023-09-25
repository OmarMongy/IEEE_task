module uart_ieee_tb();
reg clk, reset_n;
//reg rx;
//wire tx;
wire [7:0] data1, data2;
wire w1, w2;

uart_ieee uut1(
.clk(clk),
.reset_n(reset_n),
.rx(w2),
.tx(w1),
.data(data1)
);

uart_ieee uut2(
.clk(clk),
.reset_n(reset_n),
.rx(w1),
.tx(w2),
.data(data2)
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
