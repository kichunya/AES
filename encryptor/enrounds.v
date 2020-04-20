`timescale 1ns / 1ps





module enrounds(
    input           clk,
    input [3:0]     rc,
    input [127:0]   data,
    input [127:0]   keyin,
    output [127:0]  keyout,
    output [127:0]  rndout
);


wire [127:0] sb, sr, mcl;

enKeyGeneration t0 (
    .rc(rc), 
    .key(keyin), 
    .keyout(keyout)
);

ensubbytes t1(
    .data(data), 
    .sb(sb)
);

enshiftrow t2(
    .sb(sb), 
    .sr(sr)
);

enmixcolumn t3(
    .a(sr), 
    .mcl(mcl)
);

//adding round key to output of mixcolumn module 
assign rndout = keyout ^ mcl;

endmodule