module Register_Time(A,clk,set_mode,Time1,Time2,Time3,alert_time);

	input [6:0]A;
	input clk,set_mode;

	output reg [6:0]Time1;
	output reg [6:0]Time2;
	output reg [6:0]Time3;
	output [2:0]alert_time;
	/*
	Time3=red
	Time2=yellow
	Time1=green
	*/

	initial begin
		Time1=7'd0;
		Time2=7'd0;
		Time3=7'd0;  
	end

	always@(posedge clk) begin
		if(set_mode) begin
			Time3=Time2;
			Time2=Time1;
			Time1=A;
		end
	end

	assign alert_time[0]=(Time1[6:0]==7'd0)|(Time1[6:0]>7'd99);
	assign alert_time[1]=(Time2[6:0]==7'd0)|(Time2[6:0]>7'd6);
	assign alert_time[2]=(Time3[6:0]==7'd0)|(Time3[6:0]>7'd99);
	
endmodule
