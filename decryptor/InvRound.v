`timescale 1ns / 1ps


module InvRound(
    input           clk,
    input [3:0]     rc,
    input [127:0]   data,
    input [127:0]   keyin,
    //output [127:0]  keyout,
    output [127:0]  sb
);


wire [127:0] rndout, sr, mcl, add_rk;

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

InvMixCol t3(
    .a(add_rk), 
    .mcl(rndout)
);


assign add_rk = keyin ^ data;

endmodule