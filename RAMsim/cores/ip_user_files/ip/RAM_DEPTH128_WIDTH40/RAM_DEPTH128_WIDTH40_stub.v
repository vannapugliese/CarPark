// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Jan 28 17:02:14 2021
// Host        : LAPTOP-6QF8QC6H running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Vanna/Desktop/CarPark/RAMsim/cores/RAM_DEPTH128_WIDTH40/RAM_DEPTH128_WIDTH40_stub.v
// Design      : RAM_DEPTH128_WIDTH40
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.1" *)
module RAM_DEPTH128_WIDTH40(clka, ena, wea, addra, dina, clkb, rstb, enb, addrb, doutb, 
  rsta_busy, rstb_busy)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[6:0],dina[39:0],clkb,rstb,enb,addrb[6:0],doutb[39:0],rsta_busy,rstb_busy" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [6:0]addra;
  input [39:0]dina;
  input clkb;
  input rstb;
  input enb;
  input [6:0]addrb;
  output [39:0]doutb;
  output rsta_busy;
  output rstb_busy;
endmodule
