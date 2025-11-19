module up_down(clk,reset,up_down,count);
input clk,reset,up_down;
output reg[4:0]count;
always@(posedge clk)begin
if(reset)
count<=5'b0;
else if(up_down)begin
		if(count==5'b11111)
		count<=5'b0;
		else
		count<=count+1'b1;
		end
	else 
		if(count==0)
		count<=5'b11111;
		else
		count<=count-1'b1;
end
endmodule
	
	
