`timescale 1ns / 1ps

/*`include "D:/verilog/projects/AES_cryptography/encryptor/enKeyGeneration.v"
`include "D:/verilog/projects/AES_cryptography/encryptor/ensubbytes.v"
`include "D:/verilog/projects/AES_cryptography/encryptor/enshiftrow.v"*/


module enroundlast(
    input           clk,
    input [3:0]     rc,
    input [127:0]   rin,
    input [127:0]   keylastin,
    output [127:0]  fout
);



wire [127:0] sb, sr, mcl, keyout;

enKeyGeneration t0(
    .rc(rc),
    .key(keylastin),
    .keyout(keyout)
);

ensubbytes t1(
    .data(rin),
    .sb(sb)
);

enshiftrow t2(
    .sb(sb),
    .sr(sr)
);

assign fout = keyout ^ sr;

endmodule