module test_FSM_ClockCounter(clk,rst,set_mode,c_s,A,B,fsm_r,fsm_y,fsm_g,r_end,y_end,g_end,count);

	input clk,rst,set_mode,c_s;
	
	output [2:0]A,B;
	output fsm_r,fsm_y,fsm_g,r_end,y_end,g_end,count;
	
	
	FSM FSM1(rst,r_end,y_end,g_end,clk,set_mode,c_s,fsm_r,fsm_y,fsm_g,A,B);
	
	Clock_Counter CLKCounter(clk,rst,c_s,set_mode,fsm_r,fsm_y,fsm_g,r_end,y_end,g_end,count);

endmodule
