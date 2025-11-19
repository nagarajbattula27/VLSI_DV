module fifo(clock,reset,data_in,read_n,write_n,data_out,full,empty);
input[7:0]data_in;
input clock,reset;
input[3:0]read_n,write_n;
output empty,full;
output reg [7:0]data_out;
reg[7:0]mem[15:0];
integer i;

//write
always@(posedge clock,negedge reset)begin
if(!reset)
for(i=0;i<=15;i=i+1)begin
mem[i]<=0;
end
else 
if(!full)
mem[write_n]<=data_in;
//write_n=write_n+1;
end

//read

always@(posedge clock,negedge reset)begin
if(!reset)
data_out<=0;
else if(!empty)
data_out<=mem[read_n];
//read_n=read_n+1;
end

assign empty=(write_n==read_n);
assign full=(read_n=={~write_n[3],read_n[2:0]});//last bit of that we want sam elike complete the 
//7 111 after 000 so read is that time start it will be empty so 4 th bit suppose 0111 and 
//111 but heare 4th bit is we do invert then it willl be same then it full

endmodule









