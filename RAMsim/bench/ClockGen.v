
//


`timescale 1ms / 100us

module ClockGen #(parameter real PERIOD = 10.0) (

   output reg clk

   ) ;

   // clock-generator using a forever statement inside initial block
   initial begin

      clk = 1'b0 ;

      forever #(PERIOD/2.0) clk = ~ clk ;
   end

endmodule

