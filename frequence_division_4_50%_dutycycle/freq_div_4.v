module freq_4(reset,clk,count);
input clk,reset;
output reg count;
always@(posedge clk)begin
if(reset)
count<=0;
else if(count==1)
 count<=~count;
 else
 count<=count+1;
 end
 endmodule
