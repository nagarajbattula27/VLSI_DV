module freq_3(clk,reset,clk_out);
input clk,reset;
output  clk_out;
reg[1:0]count;
reg q;
//output reg count;
always@(posedge clk)begin
if(reset)
count<=0;
else if(count==2)
 count<=0;
else
 count<=count+1;
end

always@(negedge clk)begin
if(reset)
q<=0;
else
q<=count[0];
end

assign clk_out=q|count[0];

endmodule
