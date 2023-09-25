module RX_IEEE(
    input  clk, reset_n, 
    input  Rx_date,        // Receive date from Transimiter
    output [7:0] Rx_out 
    );
    
    reg enable_rx ;
    reg [9:0] date ;
    reg [3:0] bit_count ;  // Count the received bits 
    reg [7:0] d_reg ;      // Parallel register to store received data

     // Counter from 0 to 9
        
    always @(posedge clk or negedge reset_n) begin
           if (!reset_n) begin
               bit_count <= 4'b0 ;
               enable_rx <= 0 ;
           end
            
           else begin 
               if (bit_count < 4'b1000) begin
                   bit_count <= bit_count + 1 ;
                   enable_rx <= 1 ;
               end
               
               else if (bit_count == 4'b1000) begin
                   bit_count = bit_count +1 ;
                   enable_rx <= 0 ;
                end    
                           
               else begin
                   bit_count <= 4'b0000 ;
                   enable_rx <= 0 ;
               end    
           end
     end
     
     // de_mux recieve the serial date 
     
    always @(*) 
    begin 
        date = 10'b1_1001_1001_0 ;
       case(bit_count) 
           0: date[0] = Rx_date ;
           1: date[1] = Rx_date ;
           2: date[2] = Rx_date ;
           3: date[3] = Rx_date ;
           4: date[4] = Rx_date ;
           5: date[5] = Rx_date ;
           6: date[6] = Rx_date ;
           7: date[7] = Rx_date ;
           8: date[8] = Rx_date ;
           9: date[9] = Rx_date ; 
            default : date = 10'b1_1001_1001_0 ;
       endcase   
   end
   
   // Parallel register load  
   
  always @(posedge clk, negedge reset_n)
   begin
      if(!reset_n) 
          d_reg <= 'b0 ;
      else if (enable_rx == 1 && date[0] == 0 && date[9] == 1) // To detect start bit and end bit 
          {d_reg[7:0]} <= {date [8:1]} ;
      else
          d_reg <= d_reg ;  
   end
   
   assign {Rx_out} = {d_reg} ;
   
endmodule
