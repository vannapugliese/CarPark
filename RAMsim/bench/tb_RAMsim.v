`timescale 1ms / 100us

module tb_RAMsim ;


   /////////////////////////////////
   //       clock generator       //
   /////////////////////////////////

   wire clk100 ;

   ClockGen  ClockGen_inst ( .clk(clk100) ) ;



   ///////////////////////////
   //   device under test   //
   ///////////////////////////

   reg rst ;
   
   reg en = 1'b1;

   reg wr_enable = 1'b0 ;
   reg rd_enable = 1'b0 ;
   
   reg [6:0]addressWR = 7'b0000000;
   reg [6:0]addressRD = 7'b0000000;

   reg  [39:0] wr_data = 40'h0000000000 ;
   wire [39:0] rd_data ;

   RAMsim   DUT (

      // clock and reset
      .Clock     (       clk100 ),
      .Reset     (          rst ),

      // write section
      .WrEnable  (    wr_enable ),
      .WrData    ( wr_data [39:0]  ),
	  .AddressWR (  addressWR ),

      // read section
      .RdEnable  (    rd_enable ),
      .RdData    ( rd_data [39:0] ),
	  .AddressRD ( addressRD ),

      // diagnostics
      .BusyWR      (         rsta_busy ),
      .BusyRD     (        rstb_busy )

      ) ;



   //////////////////
   //   stimulus   //
   //////////////////


   //
   // reset process
   //
   initial begin
      #72  rst = 1'b1 ;    // assert reset
      #100 rst = 1'b0 ;    // release reset
   end
   
  
   


   //
   // write process
   //
   integer wr ;

   initial begin

      #300   // wait for reset to be released

      for (wr = 0; wr < 110; wr = wr+1) begin

         #100 wr_data[39:0] = $random ;
		 addressWR = addressWR + 1'b1;

         @(posedge clk100) wr_enable = 1'b1 ;    // "dirty" way to generate a single clock-pulse control signal
         @(posedge clk100) wr_enable = 1'b0 ;
      end

   end

   //
   // read process
   //
   integer rd ;

   initial begin

      #300   // wait for reset to be released

      #400   // start reading only after 800ns

      for( rd = 0; rd < 16; rd = rd+1) begin

         #1000  addressRD = addressRD + 2'b10;

         @(posedge clk100) rd_enable = 1'b1 ;    // "dirty" way to generate a single clock-pulse control signal
         @(posedge clk100) rd_enable = 1'b0 ;
      end


      #4000   // stop reading

      for (rd = 0; rd < 50; rd = rd+1) begin

         #100  addressRD = addressRD + 1'b1;
         @(posedge clk100) rd_enable = 1'b1 ;
         @(posedge clk100) rd_enable = 1'b0 ;
      end

      #1000 $finish ;

   end
   
 endmodule  