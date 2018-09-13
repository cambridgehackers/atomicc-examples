`include "iobufVec.generated.vh"

`default_nettype none
module IobufVec (
    inout wire [15:0]IO,
    input wire [15:0]I,
    output wire [15:0]O,
    input wire T);
    wire CLK;
    wire iobufs10$I;
    wire iobufs10$IO;
    wire iobufs10$O;
    wire iobufs11$I;
    wire iobufs11$IO;
    wire iobufs11$O;
    wire iobufs12$I;
    wire iobufs12$IO;
    wire iobufs12$O;
    wire iobufs13$I;
    wire iobufs13$IO;
    wire iobufs13$O;
    wire iobufs14$I;
    wire iobufs14$IO;
    wire iobufs14$O;
    wire iobufs15$I;
    wire iobufs15$IO;
    wire iobufs15$O;
    wire iobufs2$I;
    wire iobufs2$IO;
    wire iobufs2$O;
    wire iobufs3$I;
    wire iobufs3$IO;
    wire iobufs3$O;
    wire iobufs4$I;
    wire iobufs4$IO;
    wire iobufs4$O;
    wire iobufs5$I;
    wire iobufs5$IO;
    wire iobufs5$O;
    wire iobufs6$I;
    wire iobufs6$IO;
    wire iobufs6$O;
    wire iobufs7$I;
    wire iobufs7$IO;
    wire iobufs7$O;
    wire iobufs8$I;
    wire iobufs8$IO;
    wire iobufs8$O;
    wire iobufs9$I;
    wire iobufs9$IO;
    wire iobufs9$O;
    wire nRST;
    IOBUF iobufs0 (
        .I(I[ 0 : 1 ]),
        .IO(IO[ 0 : 1 ]),
        .O(O[ 0 : 1 ]),
        .T(T));
    IOBUF iobufs1 (
        .I(I[ 1 : 1 ]),
        .IO(IO[ 1 : 1 ]),
        .O(O[ 1 : 1 ]),
        .T(T));
    IOBUF iobufs2 (
        .I(iobufs2$I),
        .IO(iobufs2$IO),
        .O(iobufs2$O),
        .T(T));
    IOBUF iobufs3 (
        .I(iobufs3$I),
        .IO(iobufs3$IO),
        .O(iobufs3$O),
        .T(T));
    IOBUF iobufs4 (
        .I(iobufs4$I),
        .IO(iobufs4$IO),
        .O(iobufs4$O),
        .T(T));
    IOBUF iobufs5 (
        .I(iobufs5$I),
        .IO(iobufs5$IO),
        .O(iobufs5$O),
        .T(T));
    IOBUF iobufs6 (
        .I(iobufs6$I),
        .IO(iobufs6$IO),
        .O(iobufs6$O),
        .T(T));
    IOBUF iobufs7 (
        .I(iobufs7$I),
        .IO(iobufs7$IO),
        .O(iobufs7$O),
        .T(T));
    IOBUF iobufs8 (
        .I(iobufs8$I),
        .IO(iobufs8$IO),
        .O(iobufs8$O),
        .T(T));
    IOBUF iobufs9 (
        .I(iobufs9$I),
        .IO(iobufs9$IO),
        .O(iobufs9$O),
        .T(T));
    IOBUF iobufs10 (
        .I(iobufs10$I),
        .IO(iobufs10$IO),
        .O(iobufs10$O),
        .T(T));
    IOBUF iobufs11 (
        .I(iobufs11$I),
        .IO(iobufs11$IO),
        .O(iobufs11$O),
        .T(T));
    IOBUF iobufs12 (
        .I(iobufs12$I),
        .IO(iobufs12$IO),
        .O(iobufs12$O),
        .T(T));
    IOBUF iobufs13 (
        .I(iobufs13$I),
        .IO(iobufs13$IO),
        .O(iobufs13$O),
        .T(T));
    IOBUF iobufs14 (
        .I(iobufs14$I),
        .IO(iobufs14$IO),
        .O(iobufs14$O),
        .T(T));
    IOBUF iobufs15 (
        .I(iobufs15$I),
        .IO(iobufs15$IO),
        .O(iobufs15$O),
        .T(T));
    assign O = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign iobufs10$I = I[ 10 : 1 ] I [ 0 ];
    assign iobufs10$IO = IO[ 10 : 1 ] IO [ 0 ];
    assign iobufs11$I = I[ 11 : 1 ] I [ 0 ];
    assign iobufs11$IO = IO[ 11 : 1 ] IO [ 0 ];
    assign iobufs12$I = I[ 12 : 1 ] I [ 0 ];
    assign iobufs12$IO = IO[ 12 : 1 ] IO [ 0 ];
    assign iobufs13$I = I[ 13 : 1 ] I [ 0 ];
    assign iobufs13$IO = IO[ 13 : 1 ] IO [ 0 ];
    assign iobufs14$I = I[ 14 : 1 ] I [ 0 ];
    assign iobufs14$IO = IO[ 14 : 1 ] IO [ 0 ];
    assign iobufs15$I = I[ 15 : 1 ] I [ 0 ];
    assign iobufs15$IO = IO[ 15 : 1 ] IO [ 0 ];
    assign iobufs2$I = I[ 2 : 1 ] I [ 0 ];
    assign iobufs2$IO = IO[ 2 : 1 ] IO [ 0 ];
    assign iobufs3$I = I[ 3 : 1 ] I [ 0 ];
    assign iobufs3$IO = IO[ 3 : 1 ] IO [ 0 ];
    assign iobufs4$I = I[ 4 : 1 ] I [ 0 ];
    assign iobufs4$IO = IO[ 4 : 1 ] IO [ 0 ];
    assign iobufs5$I = I[ 5 : 1 ] I [ 0 ];
    assign iobufs5$IO = IO[ 5 : 1 ] IO [ 0 ];
    assign iobufs6$I = I[ 6 : 1 ] I [ 0 ];
    assign iobufs6$IO = IO[ 6 : 1 ] IO [ 0 ];
    assign iobufs7$I = I[ 7 : 1 ] I [ 0 ];
    assign iobufs7$IO = IO[ 7 : 1 ] IO [ 0 ];
    assign iobufs8$I = I[ 8 : 1 ] I [ 0 ];
    assign iobufs8$IO = IO[ 8 : 1 ] IO [ 0 ];
    assign iobufs9$I = I[ 9 : 1 ] I [ 0 ];
    assign iobufs9$IO = IO[ 9 : 1 ] IO [ 0 ];
    // Extra assigments, not to output wires
    assign iobufs10$O = O[ 10 : 1 ] O [ 0 ];
    assign iobufs11$O = O[ 11 : 1 ] O [ 0 ];
    assign iobufs12$O = O[ 12 : 1 ] O [ 0 ];
    assign iobufs13$O = O[ 13 : 1 ] O [ 0 ];
    assign iobufs14$O = O[ 14 : 1 ] O [ 0 ];
    assign iobufs15$O = O[ 15 : 1 ] O [ 0 ];
    assign iobufs2$O = O[ 2 : 1 ] O [ 0 ];
    assign iobufs3$O = O[ 3 : 1 ] O [ 0 ];
    assign iobufs4$O = O[ 4 : 1 ] O [ 0 ];
    assign iobufs5$O = O[ 5 : 1 ] O [ 0 ];
    assign iobufs6$O = O[ 6 : 1 ] O [ 0 ];
    assign iobufs7$O = O[ 7 : 1 ] O [ 0 ];
    assign iobufs8$O = O[ 8 : 1 ] O [ 0 ];
    assign iobufs9$O = O[ 9 : 1 ] O [ 0 ];
endmodule 

`default_nettype wire    // set back to default value
