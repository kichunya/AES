
module Make_Inv_Key_4(
    input [127 : 0] key_in,
    output [127 : 0] key_out
);

    wire [127 : 0] key_0, key_1, key_2, key_3, key_4, key_5, key_6, key_7, key_8, key_9;

    /*always@(key_in) 
    begin
        key_out <= key_6;
    end*/

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
        .keyout(key_out)
    );


endmodule