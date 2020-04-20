`timescale 1ns / 1ps
//`include "D:/verilog/projects/AES_cryptography/encryptor/ensbox.v"

module ensubbytes(
     input [127:0] data,
     output [127:0] sb
);



     ensbox q0( 
          .a(data[127:120]),
          .c(sb[127:120]) 
     );
     ensbox q1( 
          .a(data[119:112]),
          .c(sb[119:112]) 
     );
     ensbox q2( 
          .a(data[111:104]),
          .c(sb[111:104]) 
     );
     ensbox q3( 
          .a(data[103:96]),
          .c(sb[103:96]) 
     );
     ensbox q4( 
          .a(data[95:88]),
          .c(sb[95:88]) 
     );
     ensbox q5( 
          .a(data[87:80]),
          .c(sb[87:80]) 
     );
     ensbox q6( 
          .a(data[79:72]),
          .c(sb[79:72]) 
     );
     ensbox q7( 
          .a(data[71:64]),
          .c(sb[71:64]) 
     );
     ensbox q8( 
          .a(data[63:56]),
          .c(sb[63:56]) 
     );
     ensbox q9( 
          .a(data[55:48]),
          .c(sb[55:48]) 
     );
     ensbox q10(
          .a(data[47:40]),
          .c(sb[47:40]) 
     );
     ensbox q11(
          .a(data[39:32]),
          .c(sb[39:32]) 
     );
     ensbox q12(
          .a(data[31:24]),
          .c(sb[31:24]) 
     );
     ensbox q13(
          .a(data[23:16]),
          .c(sb[23:16]) 
     );
     ensbox q14(
          .a(data[15:8]),
          .c(sb[15:8]) 
     );
     ensbox q15(
          .a(data[7:0]),
          .c(sb[7:0]) 
     );
	  
endmodule