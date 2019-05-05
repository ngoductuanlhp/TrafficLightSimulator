module changetoBCD(A6,A5,A4,A3,A2,A1,A0,D0,D1);
output [3:0]D0;
output [3:0]D1;
input A6,A5,A4,A3,A2,A1,A0;
wire [3:0]g0;
wire [3:0]g1;
wire [3:0]g2;
wire [3:0]g3;
wire [2:0]w0;
wire [2:0]w1;
wire [2:0]w2;
wire x=1'b0;

assign g0[3]=1'b0;
assign g0[2]=1'b0;
assign g0[1]=(x|(A6&(A5|A4)));
assign g0[0]=g0[1];
adder4bits_single ADDS0(x,A6,A5,A4,g0[3],g0[2],g0[1],g0[0],D1[3],w0[2],w0[1],w0[0]);

assign g1[3]=1'b0;
assign g1[2]=1'b0;
assign g1[1]=(w0[2]|w0[1]&(w0[0]|A3));
assign g1[0]=g1[1];

adder4bits_single ADDS1(w0[2],w0[1],w0[0],A3,g1[3],g1[2],g1[1],g1[0],D1[2],w1[2],w1[1],w1[0]);

assign g2[3]=1'b0;
assign g2[2]=1'b0;
assign g2[1]=(w1[2]|w1[1]&(w1[0]|A2));
assign g2[0]=g2[1];
adder4bits_single ADDS2(w1[2],w1[1],w1[0],A2,g2[3],g2[2],g2[1],g2[0],D1[1],w2[2],w2[1],w2[0]);

assign g3[3]=1'b0;
assign g3[2]=1'b0;
assign g3[1]=(w2[2]|w2[1]&(w2[0]|A1));
assign g3[0]=g3[1];
adder4bits_single ADDS3(w2[2],w2[1],w2[0],A1,g3[3],g3[2],g3[1],g3[0],D1[0],D0[3],D0[2],D0[1]);

assign D0[0]=A0;

endmodule