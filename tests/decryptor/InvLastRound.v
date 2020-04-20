`timescale 1ns / 1ps


module InvLastRound(
    input           clk,
    input [3:0]     rc,
    input [127:0]   data,
    input [127:0]   keylastin,
    //output [127:0]  keyout,
    output [127:0]  sb
);


wire [127:0]  rndout, sr;

/*invKeyGeneration t0 (
    .rc(rc), 
    .key(keyin), 
    .keyout(keyout)
);*/

InvShiftRow t1(
    .sb(rndout), 
    .sr(sr)
);

InvSubBytes t2(
    .data(sr), 
    .sb(sb)
);

/*InvMixCol t3(
    .a(add_rk), 
    .mcl(rndout)
);*/


assign rndout = keylastin ^ data;

endmodule