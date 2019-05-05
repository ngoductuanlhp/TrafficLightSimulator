module circuit_test1(CLOCK_50,SW,KEY,HEX0,HEX1,LEDR,LEDG);

	input CLOCK_50;
	input [7:0]SW;
	input [2:0]KEY;
	
	output [6:0]HEX0,HEX1;
	output [5:0]LEDR;
	output [2:0]LEDG;

	wire [2:0]A,B;
	wire fsm_r,fsm_y,fsm_g,r_end,y_end,g_end;
	wire [6:0]count;
	wire [3:0]D0,D1;
	wire [6:0]time1,time2,time3;
	
	wire small_clock;
	
	/*SW[0]=set mode
	SW[7:1]=input
	KEY[0]=reset
	KEY[1]=change state
	KEY[2]=Load
	LEDR[2:0]=red-yellow-green
	LEDG[2:0]=alert
	
	*/
	
	divider clock1(CLOCK_50,small_clock);
	
	Register_Time Register_Time1(SW[7:1],~KEY[2],SW[0],time1,time2,time3,LEDG[2:0]);

	FSM FSM1(~KEY[0],r_end,y_end,g_end,small_clock,SW[0],~KEY[1],fsm_r,fsm_y,fsm_g,LEDR[2:0],LEDR[5:3]);

	Clock_Counter CLKCounter(small_clock,~KEY[0],~KEY[1],SW[0],fsm_r,fsm_y,fsm_g,time3,time2,time1,r_end,y_end,g_end,count);
	
	changetoBCD changetoBCD(count[6],count[5],count[4],count[3],count[2],count[1],count[0],D0,D1);
	
	BCD_to_7segment BCDto7segment0(D0,HEX0,0);
	BCD_to_7segment BCDto7segment1(D1,HEX1,0);
	
endmodule
	
	

