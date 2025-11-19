module up_down_tb();
reg clk,reset;
reg up_down;
wire[4:0]count;

up_down dut(.clk(clk),.reset(reset),.up_down(up_down),.count(count));

initial begin
clk=0;
forever #5 clk=~clk;
end

task rst();begin
@(negedge clk)
reset=1'b1;
@(negedge clk)
reset=1'b0;
end
endtask

task u_d(input ud);begin
@(negedge clk)
up_down=ud;
end
endtask

initial begin

#5;rst();
#5;u_d(0);
#5;u_d(1);
#5;u_d(0);
#100;
u_d(1);
end
endmodule


