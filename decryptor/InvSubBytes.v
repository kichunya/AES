`timescale 1ns / 1ps

module InvSubBytes(
     input [127:0] data,
     output [127:0] sb
);

    InvSbox q0( 
        .a(data[127:120]),
        .c(sb[127:120]) 
    );
    InvSbox q1( 
        .a(data[119:112]),
        .c(sb[119:112]) 
    );
    InvSbox q2( 
          .a(data[111:104]),
          .c(sb[111:104]) 
     );
     InvSbox q3( 
          .a(data[103:96]),
          .c(sb[103:96]) 
     );
     InvSbox q4( 
          .a(data[95:88]),
          .c(sb[95:88]) 
     );
     InvSbox q5( 
          .a(data[87:80]),
          .c(sb[87:80]) 
     );
     InvSbox q6( 
          .a(data[79:72]),
          .c(sb[79:72]) 
     );
     InvSbox q7( 
          .a(data[71:64]),
          .c(sb[71:64]) 
     );
     InvSbox q8( 
          .a(data[63:56]),
          .c(sb[63:56]) 
     );
     InvSbox q9( 
          .a(data[55:48]),
          .c(sb[55:48]) 
     );
     InvSbox q10(
          .a(data[47:40]),
          .c(sb[47:40]) 
     );
     InvSbox q11(
          .a(data[39:32]),
          .c(sb[39:32]) 
     );
     InvSbox q12(
          .a(data[31:24]),
          .c(sb[31:24]) 
     );
     InvSbox q13(
          .a(data[23:16]),
          .c(sb[23:16]) 
     );
     InvSbox q14(
          .a(data[15:8]),
          .c(sb[15:8]) 
     );
     InvSbox q15(
          .a(data[7:0]),
          .c(sb[7:0]) 
     );
	  
endmodule