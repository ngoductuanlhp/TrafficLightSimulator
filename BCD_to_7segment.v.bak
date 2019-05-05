module BCD_to_7segment(in,out,rst);
input [3:0]in;
input rst;
output [6:0]out;
assign out[0]=rst|((~in[3]&~in[2]&~in[1]&in[0])|(in[2]&~in[0]));
assign out[1]=rst|((in[2]&~in[1]&in[0])|(in[2]&in[1]&~in[0]));
assign out[2]=rst|(~in[2]&in[1]&~in[0]);
assign out[3]=rst|((~in[2]&~in[1]&in[0])|(in[2]&~in[1]&~in[0])|(in[2]&in[1]&in[0]));
assign out[4]=rst|(in[0]|(in[2]&~in[1]));
assign out[5]=rst|((~in[3]&~in[2]&in[0])|(~in[3]&~in[2]&in[1])|(in[1]&in[0]));
assign out[6]=rst|((~in[3]&~in[2]&!in[1])|(in[2]&in[1]&in[0]));
endmodule