module Clock_Counter(clk,rst,c_s,set_mode,fsm_r,fsm_y,fsm_g,time_r,time_y,time_g,r_end,y_end,g_end,count);

	input clk,rst,c_s,set_mode,fsm_r,fsm_y,fsm_g;
	input [6:0]time_r,time_y,time_g;
	
	output r_end,y_end,g_end;
	
	output reg [6:0]count;

	wire clr_counter;
	
	/*
	parameter time_r=7'd3;
	parameter time_y=7'd4;
	parameter time_g=7'd8;
	*/
	
	always@(posedge clk) begin
		if(rst) count[6:0]<=7'd0;
		else if(clr_counter) count[6:0]<=7'd0;
		else if(set_mode) count[6:0]<=7'd0;
		else count[6:0]<=count[6:0]+1'b1;
	end
	
	assign r_end=fsm_r&(count==time_r);
	assign y_end=fsm_y&(count==time_y);
	assign g_end=fsm_g&(count==time_g);
	
	assign clr_counter=r_end||y_end||g_end||c_s;

endmodule
