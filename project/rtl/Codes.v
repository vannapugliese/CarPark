
`timescale 1ms / 100us           

module Codes #( parameter integer P)(            //inizialize ??

    output wire [3:0]code
   
   ) ;
   
   
   // generate codes
   always @(*) begin

      case( P )        
	  
	  15 : code[3:0]=4'b0000;
	  14 : code[3:0]=4'b0001;
	  13 : code[3:0]=4'b0010;
	  12 : code[3:0]=4'b0011;
	  11 : code[3:0]=4'b0100;
	  10 : code[3:0]=4'b0101;
	  9 : code[3:0]=4'b0110;
	  8 : code[3:0]=4'b0111;
	  7 : code[3:0]=4'b1000;
	  6 : code[3:0]=4'b1001;
	  5 : code[3:0]=4'b1010;
	  4 : code[3:0]=4'b1011;
	  3 : code[3:0]=4'b1100;
	  2 : code[3:0]=4'b1101;
	  1 : code[3:0]=4'b1110;
	  0 : code[3:0]=4'b1111;
	  

      

      endcase
   end  // always
   
   
   
   endmodule