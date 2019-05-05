module adder4bits_single(A3,A2,A1,A0,B3,B2,B1,B0,sum3,sum2,sum1,sum0);
input A3,A2,A1,A0;
input B3,B2,B1,B0;
output sum3,sum2,sum1,sum0;
wire c0,c1,c2;
fulladder2 add1(.A(A0),.B(B0),.sum(sum0),.c_in(0),.c_out(c0));
fulladder2 add2(.A(A1),.B(B1),.sum(sum1),.c_in(c0),.c_out(c1));
fulladder2 add3(.A(A2),.B(B2),.sum(sum2),.c_in(c1),.c_out(c2));
fulladder2 add4(.A(A3),.B(B3),.sum(sum3),.c_in(c2),.c_out(x));
endmodule