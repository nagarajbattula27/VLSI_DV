module ram_64X16(clk,reset,wr_enable,rd_enable,wr_adress,rd_adress,data_in,data_out);
input clk,reset,wr_enable,rd_enable;
input[5:0]wr_adress,rd_adress;
input[15:0]data_in;
output reg[15:0]data_out;
reg[15:0]mem[63:0];
always@(posedge clk)begin
if(reset)
mem[wr_adress]<=5'b00000;
else if(wr_enable)
mem[wr_adress]<=data_in;
end

always@(posedge clk)begin
if(reset)
data_out<=5'b00000;
else if(rd_enable)
data_out<=mem[rd_adress];
end
endmodule
