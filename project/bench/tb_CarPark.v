

`timescale 1ms / 100us

module tb_CarPark ;


   /////////////////////////////////
   //       clock generator       //
   /////////////////////////////////

   wire clk100 ;

   ClockGen  #(.PERIOD(10.0)) ClockGen_inst (.clk(clk100)) ;         //DA MODIFICARE


   ///////////////////////////
   //   device under test   //
   ///////////////////////////

   

   //////////////////
   //   stimulus   //
   //////////////////

   initial begin

     

   end


  

endmodule
