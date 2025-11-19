module FIFO_tb();
reg clock,reset;
reg[7:0]data_in;
reg[3:0]read_n,write_n;
reg empty,full;
wire[7:0]data_out;

fifo dut(.clock(clock),.reset(reset),.data_in(data_in),.data_out(data_out),.read_n(read_n),.write_n(write_n),.empty(empty),.full(full));

initial begin
clock=0;
forever #5 clock=~clock;
end

task rst();begin
@(negedge clock)
reset<=1'b1;
@(negedge clock)
reset<=1'b0;
end
endtask

task inp(input[7:0]a);begin
@(negedge clock)
data_in<=a;
end
endtask

task write(input[3:0]b);begin
@(negedge clock)
#5;write_n<=b;
end
endtask

task read(input[3:0]c);begin
@(negedge clock)
#5;read_n<=c;
end
endtask

integer i;

initial begin
rst();
for(i=0;i<=7;i=i+1)begin
inp(i);
write(i);
read(i-1);
end

#250;write(1010);
#250;read(1010);
end
initial 
$monitor("$time=%0t,clock=%0b,reset=%0b,data_in=%0b,data_out=%0b,read_n=%0b,write_n=%0b,empty(empty),full(full)",$time,clock,reset,data_in,data_out,read_n,write_n,empty,full);
endmodule


