//-----------------------------------------------------------------------------------------------------
//                               University of Torino - Department of Physics
//                                   via Giuria 1 10125, Torino, Italy
//-----------------------------------------------------------------------------------------------------
// [Filename]       tb_SequenceDetector.v [TESTBENCH]
// [Project]        Advanced Electronics Laboratory course
// [Author]         Luca Pacher - pacher@to.infn.it
// [Language]       Verilog 2001 [IEEE Std. 1364-2001]
// [Created]        May 25, 2020
// [Modified]       -
// [Description]    Example testbench module for 110 sequence detector.
// [Notes]          -
// [Version]        1.0
// [Revisions]      25.05.2020 - Created
//-----------------------------------------------------------------------------------------------------

//
// Dependencies :
//
// rtl/SequenceDetector.v
//


`timescale 1ns / 100ps

module tb_SequenceDetector ;


   /////////////////////////////////
   //   100 MHz clock generator   //
   /////////////////////////////////

   wire clk100 ;

   ClockGen  #(.PERIOD(10.0)) ClockGen_inst (.clk(clk100)) ;


   ///////////////////////////
   //   device under test   //
   ///////////////////////////

   reg rst, si = 1'b0 ;

   wire tick ;

   SequenceDetector  DUT ( .clk(clk100), .reset(rst), .si(si), .detected(tick) ) ;


   //////////////////
   //   stimulus   //
   //////////////////

   initial begin

      #20  rst = 1'b1 ;
      #175 rst = 1'b0 ;

   end


   initial begin

      #2.5      // only for better visualization, sample input data at period/2

      repeat (500) #10 si = $random ;

      #10 $finish ;

   end

endmodule
