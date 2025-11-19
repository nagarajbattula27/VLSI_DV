module SISIO_tb();
reg clk,reset,d;
wire qout;

siso dut(.clk(clk),.reset(reset),.d(d),.qout(qout));

initial begin

clk=0;
forever #5 clk=~clk;

end

task initialize();begin
@(negedge clk)
d=0;
end
endtask

task rst();begin
@(negedge clk)
reset=1'b1;
@(negedge clk)
reset=1'b0;
end
endtask

task inp(input a);begin
@(negedge clk)
d=a;
end
endtask

initial begin

rst();
initialize();
#5;inp(0);
#5;inp(1);
#5;inp(0);
#5;inp(1);
end
initial 
$monitor("$time=%0t,d=%0b,clk=%0b,reset=%0b,qout=%0b",$time,d,clk,reset,qout);
endmodule


