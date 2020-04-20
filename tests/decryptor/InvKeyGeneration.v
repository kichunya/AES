//`include "C:/intelFPGA/18.1/AES_cryptography/decryptor/KeyGeneration.v"


module InvKeyGeneration(
   input  [3:0]    rc,
   input  [127:0]  key_in,
   output reg [127:0]  keyout
);

   wire [127 : 0] key_0, key_1, key_2, key_3, key_4, key_5, key_6, key_7, key_8, key_9;

   always@(rc)
   begin
      if(rc == 4'h0) begin

         keyout = key_9;

      end else if (rc == 1) begin

         keyout = key_8;

      end else if(rc == 2) begin

         keyout = key_7;

      end else if (rc == 3) begin

         keyout = key_6;

      end else if (rc == 4) begin

         keyout = key_5;

      end else if(rc == 5) begin

         keyout = key_4;

      end else if (rc == 6) begin

         keyout = key_3;

      end else if (rc == 7) begin

         keyout = key_2;

      end else if(rc == 8) begin

         keyout = key_1;

      end else if(rc == 9)  begin

         keyout = key_0;

      end
   end
      
    

   KeyGeneration k0(
        .rc(4'h0),
        .key(key_in),
        .keyout(key_0)
   );

   KeyGeneration k1(
      .rc(4'h1),
      .key(key_0),
      .keyout(key_1)
   );

   KeyGeneration k2(
      .rc(4'h2),
      .key(key_1),
      .keyout(key_2)
   );

   KeyGeneration k3(
      .rc(4'h3),
      .key(key_2),
      .keyout(key_3)
   );

   KeyGeneration k4(
      .rc(4'h4),
      .key(key_3),
      .keyout(key_4)
   );

   KeyGeneration k5(
      .rc(4'h5),
      .key(key_4),
      .keyout(key_5)
   );

   KeyGeneration k6(
      .rc(4'h6),
      .key(key_5),
      .keyout(key_6)
   );

   KeyGeneration k7(
      .rc(4'h7),
      .key(key_6),
      .keyout(key_7)
   );

   KeyGeneration k8(
      .rc(4'h8),
      .key(key_7),
      .keyout(key_8)
   );

   KeyGeneration k9(
      .rc(4'h9),
      .key(key_8),
      .keyout(key_9)
   );




endmodule
   
 
 
 /*module enKeyGeneration(
   input  [3:0]    rc,
   input  [127:0]  key,
   output [127:0]  keyout
);
    
   
   
   wire [31:0] w0, w1, w2, w3, sb;
         
   //initialisation of key words  (32 bits = 4 bytes)      
   assign w0 = key[127:96];
   assign w1 = key[95:64];
   assign w2 = key[63:32];
   assign w3 = key[31:0];
       
       
   assign keyout[127:96]= w0 ^ sb ^ rcon(rc);
   assign keyout[95:64] = w0 ^ sb ^ rcon(rc) ^ w1;
   assign keyout[63:32] = w0 ^ sb ^ rcon(rc) ^ w1 ^ w2;
   assign keyout[31:0]  = w0 ^ sb ^ rcon(rc) ^ w1 ^ w2 ^ w3;
       

   InvSbox a1(
      .a(w3[23:16]),
      .c(sb[31:24])
   );
       
   InvSbox a2(
      .a(w3[15:8]),  
      .c(sb[23:16])
   );
       
   InvSbox a3(
      .a(w3[7:0]),
      .c(sb[15:8])
   );
       
   InvSbox a4(
     .a(w3[31:24]),
      .c(sb[7:0])
   );
       
       
       
   function [31:0]   rcon;
      input	[3:0]	rc;
      case(rc)	
         4'h0: rcon=32'h36_00_00_00;
         4'h1: rcon=32'h1b_00_00_00;
         4'h2: rcon=32'h80_00_00_00;
         4'h3: rcon=32'h40_00_00_00;
         4'h4: rcon=32'h20_00_00_00;
         4'h5: rcon=32'h10_00_00_00;
         4'h6: rcon=32'h08_00_00_00;
         4'h7: rcon=32'h04_00_00_00;
         4'h8: rcon=32'h02_00_00_00;
         4'h9: rcon=32'h01_00_00_00;
         
         default: rcon=32'h00_00_00_00;
      endcase

   endfunction

  function [31:0]	rcon;
   input	[3:0]	rc;
      case(rc)	
         4'h0: rcon=32'h01_00_00_00;
         4'h1: rcon=32'h02_00_00_00;
         4'h2: rcon=32'h04_00_00_00;
         4'h3: rcon=32'h08_00_00_00;
         4'h4: rcon=32'h10_00_00_00;
         4'h5: rcon=32'h20_00_00_00;
         4'h6: rcon=32'h40_00_00_00;
         4'h7: rcon=32'h80_00_00_00;
         4'h8: rcon=32'h1b_00_00_00;
         4'h9: rcon=32'h36_00_00_00;
         
         default: rcon=32'h00_00_00_00;
      endcase

   endfunction

endmodule*/