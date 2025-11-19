module up_down(clk,reset,up_down,count);
input clk,reset;
input up_down;
output reg[4:0]count;
always@(posedge clk)begin
if(reset)
count<=0;
else if(up_down)begin
			if(count==31)
				count<=0;
		
			else
				count<=count+1;
				end
	else	
			if(count==0)
				count<=31;
			else
				count<=count-1;
end
	
endmodule
