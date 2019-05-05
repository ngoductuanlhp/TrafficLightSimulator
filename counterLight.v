module counterLight(sel,r_end,y_end,g_end,clk,counter_A,counter_B);

	input [2:0]sel;
	input [6:0]r_end,y_end,g_end;
	input clk;
	
	output reg [6:0]counter_A,counter_B;
	
	wire [6:0]w1,w2,w3;
	wire [6:0]countA1,countA2,countA3,countA4,countA5,countA6,countA7;
	wire [6:0]countB1,countB2,countB3,countB4,countB5,countB6,countB7;
	
	assign w1=r_end+g_end;
	assign w2=w1+y_end;
	
	counterState counter1(r_end,r_end,clk,(sel[2:0]==3'd0),countA1,countB1);
	counterState counter2(w2,y_end,clk,(sel[2:0]==3'd1),countA2,countB2);
	counterState counter3(w1,g_end,clk,(sel[2:0]==3'd2),countA3,countB3);
	counterState counter4(r_end,y_end,clk,(sel[2:0]==3'd3),countA4,countB4);
	counterState counter5(y_end,w1,clk,(sel[2:0]==3'd4),countA5,countB5);
	counterState counter6(g_end,w2,clk,(sel[2:0]==3'd5),countA6,countB6);
	counterState counter7(y_end,r_end,clk,(sel[2:0]==3'd6),countA7,countB7);
	
	always@(*) begin
	case(sel)
		3'd0:counter_A=countA1;
		3'd1:counter_A=countA2;
		3'd2:counter_A=countA3;
		3'd3:counter_A=countA4;
		3'd4:counter_A=countA5;
		3'd5:counter_A=countA6;
		3'd6:counter_A=countA7;
	endcase
	end
	
	always@(*) begin
	case(sel)
		3'd0:counter_B=countB1;
		3'd1:counter_B=countB2;
		3'd2:counter_B=countB3;
		3'd3:counter_B=countB4;
		3'd4:counter_B=countB5;
		3'd5:counter_B=countB6;
		3'd6:counter_B=countB7;
	endcase
	end

endmodule
