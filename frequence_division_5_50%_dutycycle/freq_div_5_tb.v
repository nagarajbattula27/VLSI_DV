module freq_5_tb();
reg clk,reset;
wire clk_out;

freq_5 dut(.clk(clk),.reset(reset),.clk_out(clk_out));

initial begin

clk=0;
forever#5 clk=~clk;
end

task rst();begin
@(negedge clk)
reset=1'b1;
@(negedge clk)
reset=1'b0;
end
endtask

initial begin

#5;rst();
#5;rst();

end
endmodule
