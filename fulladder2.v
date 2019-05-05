module fulladder2(A,B,c_in,sum,c_out);
input A,B,c_in;
output sum,c_out;
wire w1,w2,w3;
halfadder HA1(.A(A),.B(B),.sum(w1),.c_out(w2));
halfadder HA2(.A(c_in),.B(w1),.sum(sum),.c_out(w3));
or IC7432(c_out,w2,w3);
endmodule