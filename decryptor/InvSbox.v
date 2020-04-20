`timescale 1ns / 1ps

module InvSbox(
	input  [7:0] a,
	output reg [7:0] c
);
    
always @(a)
begin
    if(a == 8'h00) begin
        c <= 8'h52;
    end else if(a == 8'h01) begin
        c <= 8'h09;
    end else if(a == 8'h02) begin
        c <= 8'h6a;
    end else if (a == 8'h03) begin
        c <= 8'hd5;
    end else if (a == 8'h04) begin
        c <= 8'h30;
    end else if (a == 8'h05) begin
        c <= 8'h36;
    end else if (a == 8'h06) begin
        c <= 8'ha5;
    end else if (a == 8'h07) begin
        c <= 8'h38;
    end else if (a == 8'h08) begin
        c <= 8'hbf;
    end else if (a == 8'h09) begin
        c <= 8'h40;
    end else if (a == 8'h0a) begin
        c <= 8'ha3;
    end else if (a == 8'h0b) begin
        c <= 8'h9e;
    end else if (a == 8'h0c) begin
        c <= 8'h81;
    end else if (a == 8'h0d) begin
        c <= 8'hf3;
    end else if (a == 8'h0e) begin
        c <= 8'hd7;
    end else if (a == 8'h0f) begin
        c <= 8'hfb;
    end else if (a == 8'h10) begin
        c <= 8'h7c;
    end else if (a == 8'h11) begin
        c <= 8'he3;
    end else if (a == 8'h12) begin
        c <= 8'h39;
    end else if (a == 8'h13) begin
        c <= 8'h82;
    end else if (a == 8'h14) begin
        c <= 8'h9b;
    end else if (a == 8'h15) begin
        c <= 8'h2f;
    end else if (a == 8'h16) begin
        c <= 8'hff;
    end else if (a == 8'h17) begin
        c <= 8'h87;
    end else if (a == 8'h18) begin
        c <= 8'h34;
    end else if (a == 8'h19) begin
        c <= 8'h8e;
    end else if (a == 8'h1a) begin
        c <= 8'h43;
    end else if (a == 8'h1b) begin
        c <= 8'h44;
    end else if (a == 8'h1c) begin
        c <= 8'hc4;
    end else if (a == 8'h1d) begin
        c <= 8'hde;
    end else if (a == 8'h1e) begin
        c <= 8'he9;
    end else if (a == 8'h1f) begin
        c <= 8'hcb;
    end else if (a == 8'h20) begin
        c <= 8'h54;
    end else if (a == 8'h21) begin
        c <= 8'h7b;
    end else if (a == 8'h22) begin
        c <= 8'h94;
    end else if (a == 8'h23) begin
        c <= 8'h32;
    end else if (a == 8'h24) begin
        c <= 8'ha6;
    end else if (a == 8'h25) begin
        c <= 8'hc2;
    end else if (a == 8'h26) begin
        c <= 8'h23;
    end else if (a == 8'h27) begin
        c <= 8'h3d;
    end else if (a == 8'h28) begin
        c <= 8'hee;
    end else if (a == 8'h29) begin
        c <= 8'h4c;
    end else if (a == 8'h2a) begin
        c <= 8'h95;
    end else if (a == 8'h2b) begin
        c <= 8'h0b;
    end else if (a == 8'h2c) begin
        c <= 8'h42;
    end else if (a == 8'h2d) begin
        c <= 8'hfa;
    end else if (a == 8'h2e) begin
        c <= 8'hc3;
    end else if (a == 8'h2f) begin
        c <= 8'h4e;
    end else if (a == 8'h30) begin
        c <= 8'h08;
    end else if (a == 8'h31) begin
        c <= 8'h2e;
    end else if (a == 8'h32) begin
        c <= 8'ha1;
    end else if (a == 8'h33) begin
        c <= 8'h66;
    end else if (a == 8'h34) begin
        c <= 8'h28;
    end else if (a == 8'h35) begin
        c <= 8'hd9;
    end else if (a == 8'h36) begin
        c <= 8'h24;
    end else if (a == 8'h37) begin
        c <= 8'hb2;
    end else if (a == 8'h38) begin
        c <= 8'h76;
    end else if (a == 8'h39) begin
        c <= 8'h5b;
    end else if (a == 8'h3a) begin
        c <= 8'ha2;
    end else if (a == 8'h3b) begin
        c <= 8'h49;
    end else if (a == 8'h3c) begin
        c <= 8'h6d;
    end else if (a == 8'h3d) begin
        c <= 8'h8b;
    end else if (a == 8'h3e) begin
        c <= 8'hd1;
    end else if (a == 8'h3f) begin
        c <= 8'h25;
    end else if (a == 8'h40) begin
        c <= 8'h72;
    end else if (a == 8'h41) begin
        c <= 8'hf8;
    end else if (a == 8'h42) begin
        c <= 8'hf6;
    end else if (a == 8'h43) begin
        c <= 8'h64;
    end else if (a == 8'h44) begin
        c <= 8'h86;
    end else if (a == 8'h45) begin
        c <= 8'h68;
    end else if (a == 8'h46) begin
        c <= 8'h98;
    end else if (a == 8'h47) begin
        c <= 8'h16;
    end else if (a == 8'h48) begin
        c <= 8'hd4;
    end else if (a == 8'h49) begin
        c <= 8'ha4;
    end else if (a == 8'h4a) begin
        c <= 8'h5c;
    end else if (a == 8'h4b) begin
        c <= 8'hcc;
    end else if (a == 8'h4c) begin
        c <= 8'h5d;
    end else if (a == 8'h4d) begin
        c <= 8'h65;
    end else if (a == 8'h4e) begin
        c <= 8'hb6;
    end else if (a == 8'h4f) begin
        c <= 8'h92;
    end else if (a == 8'h50) begin
        c <= 8'h6c;
    end else if (a == 8'h51) begin
        c <= 8'h70;
    end else if (a == 8'h52) begin
        c <= 8'h48;
    end else if (a == 8'h53) begin
        c <= 8'h50;
    end else if (a == 8'h54) begin
        c <= 8'hfd;
    end else if (a == 8'h55) begin
        c <= 8'hed;
    end else if (a == 8'h56) begin
        c <= 8'hb9;
    end else if (a == 8'h57) begin
        c <= 8'hda;
    end else if (a == 8'h58) begin
        c <= 8'h5e;
    end else if (a == 8'h59) begin
        c <= 8'h15;
    end else if (a == 8'h5a) begin
        c <= 8'h46;
    end else if (a == 8'h5b) begin
        c <= 8'h57;
    end else if (a == 8'h5c) begin
        c <= 8'ha7;
    end else if (a == 8'h5d) begin
        c <= 8'h8d;
    end else if (a == 8'h5e) begin
        c <= 8'h9d; 
    end else if (a == 8'h5f) begin
        c <= 8'h84;
    end else if (a == 8'h60) begin
        c <= 8'h90;
    end else if (a == 8'h61) begin
        c <= 8'hd8;
    end else if (a == 8'h62) begin
        c <= 8'hab;
    end else if (a == 8'h63) begin
        c <= 8'h00;
    end else if (a == 8'h64) begin
        c <= 8'h8c;
    end else if (a == 8'h65) begin
        c <= 8'hbc;
    end else if (a == 8'h66) begin
        c <= 8'hd3;
    end else if (a == 8'h67) begin
        c <= 8'h0a; 
    end else if (a == 8'h68) begin
        c <= 8'hf7;
    end else if (a == 8'h69) begin
        c <= 8'he4;
    end else if (a == 8'h6a) begin
        c <= 8'h58;
    end else if (a == 8'h6b) begin
        c <= 8'h05;
    end else if (a == 8'h6c) begin
        c <= 8'hb8;
    end else if (a == 8'h6d) begin
        c <= 8'hb3;
    end else if (a == 8'h6e) begin
        c <= 8'h45;
    end else if (a == 8'h6f) begin
        c <= 8'h06;
    end else if (a == 8'h70) begin
        c <= 8'hd0;    
    end else if (a == 8'h71) begin
        c <= 8'h2c;
    end else if (a == 8'h72) begin
        c <= 8'h1e;
    end else if (a == 8'h73) begin
        c <= 8'h8f;
    end else if (a == 8'h74) begin
        c <= 8'hca;
    end else if (a == 8'h75) begin
        c <= 8'h3f;
    end else if (a == 8'h76) begin
        c <= 8'h0f;
    end else if (a == 8'h77) begin
        c <= 8'h02; 
    end else if (a == 8'h78) begin
        c <= 8'hc1;
    end else if (a == 8'h79) begin
        c <= 8'haf;
    end else if (a == 8'h7a) begin
        c <= 8'hbd;
    end else if (a == 8'h7b) begin
        c <= 8'h03;
    end else if (a == 8'h7c) begin
        c <= 8'h01;
    end else if (a == 8'h7d) begin
        c <= 8'h13;
    end else if (a == 8'h7e) begin
        c <= 8'h8a;
    end else if (a == 8'h7f) begin
        c <= 8'h6b;
    end else if (a == 8'h80) begin
        c <= 8'h3a;
    end else if (a == 8'h81) begin
        c <= 8'h91;
    end else if (a == 8'h82) begin
        c <= 8'h11;
    end else if (a == 8'h83) begin
        c <= 8'h41;
    end else if (a == 8'h84) begin
        c <= 8'h4f;
    end else if (a == 8'h85) begin
        c <= 8'h67;
    end else if (a == 8'h86) begin
        c <= 8'hdc;
    end else if (a == 8'h87) begin
        c <= 8'hea;
    end else if (a == 8'h88) begin
        c <= 8'h97;
    end else if (a == 8'h89) begin
        c <= 8'hf2;
    end else if (a == 8'h8a) begin
        c <= 8'hcf;
    end else if (a == 8'h8b) begin
        c <= 8'hce;
    end else if (a == 8'h8c) begin
        c <= 8'hf0;
    end else if (a == 8'h8d) begin
        c <= 8'hb4;
    end else if (a == 8'h8e) begin
        c <= 8'he6;
    end else if (a == 8'h8f) begin
        c <= 8'h73; 
    end else if (a == 8'h90) begin
        c <= 8'h96;
    end else if (a == 8'h91) begin
        c <= 8'hac;
    end else if (a == 8'h92) begin
        c <= 8'h74;
    end else if (a == 8'h93) begin
        c <= 8'h22;
    end else if (a == 8'h94) begin
        c <= 8'he7;
    end else if (a == 8'h95) begin
        c <= 8'had;
    end else if (a == 8'h96) begin
        c <= 8'h35;
    end else if (a == 8'h97) begin
        c <= 8'h85;
    end else if (a == 8'h98) begin
        c <= 8'he2;
    end else if (a == 8'h99) begin
        c <= 8'hf9;
    end else if (a == 8'h9a) begin
        c <= 8'h37;
    end else if (a == 8'h9b) begin
        c <= 8'he8;
    end else if (a == 8'h9c) begin
        c <= 8'h1c;
    end else if (a == 8'h9d) begin
        c <= 8'h75;
    end else if (a == 8'h9e) begin
        c <= 8'hdf;
    end else if (a == 8'h9f) begin
        c <= 8'h6e; 
    end else if (a == 8'ha0) begin
        c <= 8'h47;
    end else if (a == 8'ha1) begin
        c <= 8'hf1;
    end else if (a == 8'ha2) begin
        c <= 8'h1a; 
    end else if (a == 8'ha3) begin
        c <= 8'h71;
    end else if (a == 8'ha4) begin
        c <= 8'h1d;
    end else if (a == 8'ha5) begin
        c <= 8'h29;
    end else if (a == 8'ha6) begin
        c <= 8'hc5; 
    end else if (a == 8'ha7) begin
        c <= 8'h89;
    end else if (a == 8'ha8) begin
        c <= 8'h6f;
    end else if (a == 8'ha9) begin
        c <= 8'hb7;
    end else if (a == 8'haa) begin
        c <= 8'h62;
    end else if (a == 8'hab) begin
        c <= 8'h0e;
    end else if (a == 8'hac) begin
        c <= 8'haa;
    end else if (a == 8'had) begin
        c <= 8'h18;
    end else if (a == 8'hae) begin
        c <= 8'hbe;
    end else if (a == 8'haf) begin
        c <= 8'h1b;
    end else if (a == 8'hb0) begin
        c <= 8'hfc;
    end else if (a == 8'hb1) begin
        c <= 8'h56;
    end else if (a == 8'hb2) begin
        c <= 8'h3e;
    end else if (a == 8'hb3) begin
        c <= 8'h4b;
    end else if (a == 8'hb4) begin
        c <= 8'hc6;
    end else if (a == 8'hb5) begin
        c <= 8'hd2;
    end else if (a == 8'hb6) begin
        c <= 8'h79; 
    end else if (a == 8'hb7) begin
        c <= 8'h20;
    end else if (a == 8'hb8) begin
        c <= 8'h9a;
    end else if (a == 8'hb9) begin
        c <= 8'hdb;
    end else if (a == 8'hba) begin
        c <= 8'hc0;
    end else if (a == 8'hbb) begin
        c <= 8'hfe;
    end else if (a == 8'hbc) begin
        c <= 8'h78;
    end else if (a == 8'hbd) begin
        c <= 8'hcd;
    end else if (a == 8'hbe) begin
        c <= 8'h5a;
    end else if (a == 8'hbf) begin
        c <= 8'hf4;
    end else if (a == 8'hc0) begin
        c <= 8'h1f;
    end else if (a == 8'hc1) begin
        c <= 8'hdd;
    end else if (a == 8'hc2) begin
        c <= 8'ha8;
    end else if (a == 8'hc3) begin
        c <= 8'h33;
    end else if (a == 8'hc4) begin
        c <= 8'h88;
    end else if (a == 8'hc5) begin
        c <= 8'h07;
    end else if (a == 8'hc6) begin
        c <= 8'hc7;
    end else if (a == 8'hc7) begin
        c <= 8'h31;
    end else if (a == 8'hc8) begin
        c <= 8'hb1;
    end else if (a == 8'hc9) begin
        c <= 8'h12;
    end else if (a == 8'hca) begin
        c <= 8'h10;
    end else if (a == 8'hcb) begin
        c <= 8'h59;
    end else if (a == 8'hcc) begin
        c <= 8'h27;
    end else if (a == 8'hcd) begin
        c <= 8'h80;
    end else if (a == 8'hce) begin
        c <= 8'hec;
    end else if (a == 8'hcf) begin
        c <= 8'h5f;
    end else if (a == 8'hd0) begin
        c <= 8'h60;
    end else if (a == 8'hd1) begin
        c <= 8'h51;
    end else if (a == 8'hd2) begin
        c <= 8'h7f; 
    end else if (a == 8'hd3) begin
        c <= 8'ha9;
    end else if (a == 8'hd4) begin
        c <= 8'h19;
    end else if (a == 8'hd5) begin
        c <= 8'hb5;
    end else if (a == 8'hd6) begin
        c <= 8'h4a;
    end else if (a == 8'hd7) begin
        c <= 8'h0d;
    end else if (a == 8'hd8) begin
        c <= 8'h2d;
    end else if (a == 8'hd9) begin
        c <= 8'he5;
    end else if (a == 8'hda) begin
        c <= 8'h7a;
    end else if (a == 8'hdb) begin
        c <= 8'h9f;
    end else if (a == 8'hdc) begin
        c <= 8'h93;
    end else if (a == 8'hdd) begin
        c <= 8'hc9;
    end else if (a == 8'hde) begin
        c <= 8'h9c;        
    end else if (a == 8'hdf) begin
        c <= 8'hef;
    end else if (a == 8'he0) begin
        c <= 8'ha0;
    end else if (a == 8'he1) begin
        c <= 8'he0;
    end else if (a == 8'he2) begin
        c <= 8'h3b;
    end else if (a == 8'he3) begin
        c <= 8'h4d;
    end else if (a == 8'he4) begin
        c <= 8'hae;
    end else if (a == 8'he5) begin
        c <= 8'h2a; 
    end else if (a == 8'he6) begin
        c <= 8'hf5;
    end else if (a == 8'he7) begin
        c <= 8'hb0;
    end else if (a == 8'he8) begin
        c <= 8'hc8;
    end else if (a == 8'he9) begin
        c <= 8'heb;
    end else if (a == 8'hea) begin
        c <= 8'hbb;
    end else if (a == 8'heb) begin
        c <= 8'h3c;
    end else if (a == 8'hec) begin
        c <= 8'h83;
    end else if (a == 8'hed) begin
        c <= 8'h53;
    end else if (a == 8'hee) begin
        c <= 8'h99;
    end else if (a == 8'hef) begin
        c <= 8'h61;
    end else if (a == 8'hf0) begin
        c <= 8'h17;
    end else if (a == 8'hf1) begin
        c <= 8'h2b;
    end else if (a == 8'hf2) begin
        c <= 8'h04;
    end else if (a == 8'hf3) begin
        c <= 8'h7e;
    end else if (a == 8'hf4) begin
        c <= 8'hba;
    end else if (a == 8'hf5) begin
        c <= 8'h77;
    end else if (a == 8'hf6) begin
        c <= 8'hd6;
    end else if (a == 8'hf7) begin
        c <= 8'h26;
    end else if (a == 8'hf8) begin
        c <= 8'he1;
    end else if (a == 8'hf9) begin
        c <= 8'h69;
    end else if (a == 8'hfa) begin
        c <= 8'h14;
    end else if (a == 8'hfb) begin
        c <= 8'h63;
    end else if (a == 8'hfc) begin
        c <= 8'h55;
    end else if (a == 8'hfd) begin
        c <= 8'h21;
    end else if (a == 8'hfe) begin
        c <= 8'h0c;
    end else if (a == 8'hff) begin
        c <= 8'h7d;
    end else
        c <= 8'h0;
end
endmodule
