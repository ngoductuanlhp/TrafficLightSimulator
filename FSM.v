module FSM(rst,r_end,y_end,g_end,clk,set_mode,c_s,fsm_r,fsm_y,fsm_g,A,B);

	input rst,r_end,y_end,g_end,clk,set_mode,c_s;
	
	output reg [2:0]A,B;
	output reg fsm_r,fsm_y,fsm_g;
	
	reg [2:0]current_s,next_s;
	
	parameter AR_BR=3'd0;
	parameter AR_BY=3'd1;
	parameter AR_BG=3'd2;
	parameter AR_BY1=3'd3;
	parameter AY_BR=3'd4;
	parameter AG_BR=3'd5;
	parameter AY_BR1=3'd6;
	
	always@(*) begin
		case(current_s[2:0])
		AR_BR:begin 
					if(r_end||c_s) next_s=AR_BY;
					else next_s=current_s;
				end
		AR_BY:begin 
					if(y_end||c_s) next_s=AR_BG;
					else next_s=current_s;
				end
		AR_BG:begin 
					if(g_end||c_s) next_s=AR_BY1;
					else next_s=current_s;
				end
		AR_BY1:begin 
					if(r_end||c_s) next_s=AY_BR;
					else next_s=current_s;
				end
		AY_BR:begin 
					if(y_end||c_s) next_s=AG_BR;
					else next_s=current_s;
				end
		AG_BR:begin 
					if(g_end||c_s) next_s=AY_BR1;
					else next_s=current_s;
				end
		AY_BR1:begin 
					if(r_end||c_s) next_s=AR_BY;
					else next_s=current_s;
				end	
		endcase
	end
	
	always@(posedge clk,posedge rst,posedge set_mode) begin
	if(rst) current_s<=AR_BR;
	else if(set_mode) current_s<=AR_BR;
	else current_s<=next_s;
	end		
	
	always@(*) begin
	case(current_s[2:0])
	AG_BR:A=3'b001;
	AY_BR:A=3'b010;
	AY_BR1:A=3'b010;
	default:A=3'b100;
	endcase
	end
	
	always@(*) begin
	case(current_s[2:0])
	AR_BY1:B=3'b010;
	AR_BY:B=3'b010;
	AR_BG:B=3'b001;
	default:B=3'b100;
	endcase
	end
	
	always@(*) begin
	case(current_s[2:0])
	AR_BR:fsm_r=1;
	AR_BY1:fsm_r=1;
	AY_BR1:fsm_r=1;
	default:fsm_r=0;
	endcase
	end
	
	always@(*) begin
	case(current_s[2:0])
	AR_BY:fsm_y=1;
	AY_BR:fsm_y=1;
	default:fsm_y=0;
	endcase
	end
	
	always@(*) begin
	case(current_s[2:0])
	AR_BG:fsm_g=1;
	AG_BR:fsm_g=1;
	default:fsm_g=0;
	endcase
	end

endmodule