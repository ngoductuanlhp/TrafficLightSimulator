module divider(clk, clk_out);

	input clk; 
	output reg clk_out;
	
	initial clk_out = 0;
	integer count;
	initial count = 0;
	
	always@(posedge clk) begin
	  count <= count + 1;
	  if (count == 25000000 )
	  begin 
		 clk_out <= ~clk_out;
		 count <= 1;
	  end
	end 
	
endmodule 