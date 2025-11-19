module freq_5(clk,reset,clk_out);
input clk,reset;
output clk_out;
reg[2:0]count;
reg q;
always@(posedge clk)begin
if(reset)
count<=0;
else if(count==5)
  count<=0;
 else
  count<=count+1;
end

always@(negedge clk)begin
if(reset)
q<=0;
else
q<=count[1];
end
assign clk_out=q|count[1];
endmodule
