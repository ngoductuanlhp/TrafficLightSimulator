module counterState(begin_A,begin_B,clk,en,count_A,count_B);

	input [6:0]begin_A,begin_B;
	input clk,en;
	
	output reg [6:0]count_A,count_B;
	
	always@(posedge clk) begin
		if(~en) count_A[6:0]<=begin_A[6:0];
		else count_A[6:0]<=count_A[6:0]-1;
		end
		
	always@(posedge clk) begin
		if(~en) count_B[6:0]<=begin_B[6:0];
		else count_B[6:0]<=count_B[6:0]-1;
		end
		
endmodule
