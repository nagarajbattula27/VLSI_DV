    module ram_16X8(clk,reset,wr_enable,rd_enable,din,dout);
input clk,reset;
input[3:0]wr_enable,rd_enable;
input[7:0]din;
output reg[7:0]dout;
reg[7:0]mem[0:15];

always@(posedge clk)begin
if(reset)
	mem[wr_enable]<=4'b0000;
else
	mem[wr_enable]<=din;
end
	
always@(posedge clk)begin
if(reset)
	dout<=4'b0000;
else
	dout<=mem[rd_enable];
end

endmodule
