`timescale 1ms / 100us

module RAMsim (

   // clock and reset
   input  wire Clock,              // clock
   
   input  wire Reset,              // reset, active-high

   input  wire  Enable,
   
   // write section
   input  wire WrEnable,            // write-enable
   input  wire [39:0] WrData,       // input data
   input  reg  [6:0]AddressWR,      //write pointer
   // read section
   input  wire RdEnable,            // read-enable
   input  reg  [6:0] AddressRD,     // read pointer
   output wire [39:0] RdData,       // output data

   // diagnostics
   output wire BusyWR,         // flags (?)
   output wire BusyRD

   ) ;


   // the actual RAM implementation is placed in ../cores/RAM_DEPTH128_WIDTH40/

   RAM_DEPTH128_WIDTH40   RAM_DEPTH128_WIDTH40_inst (

      .clka   (        Clock ),
	  .clkb   (        Clock ),
      .rstb   (        Reset ),
      .dina        (  WrData[39:0] ),
	  .addra       (  AddressWR ),
	  .addrb       (  AddressRD ),
      .wea         (     WrEnable ),
      .enb         (     RdEnable ),
      .doutb       (  RdData[39:0] ),
      .rsta_busy   (         BusyWR ),
      .rstb_busy   (        BusyRD )

      ) ;

endmodule
