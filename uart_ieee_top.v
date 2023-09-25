module uart_ieee(
input clk, reset_n,
input rx,
output tx,
output [7:0] data
);
TX_IEEE U1(
.clk(clk),
.reset_n(reset_n),
.tx(tx)
);
RX_IEEE U2(
.clk(clk),
.reset_n(reset_n),
.Rx_date(rx),
.Rx_out(data)
);  
endmodule
