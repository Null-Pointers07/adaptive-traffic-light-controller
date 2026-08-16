module tb_bitcounter;
reg clk, rst;
wire reload;
wire [2:0] b_counter;

bit_count dut ( .clk(clk), .rst(rst), .reload(reload), .b_counter(b_counter) );

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars( 0, tb_bitcounter);
    clk <= 0;
    rst <= 0;
    #10 rst <= 1;
    repeat(24) @(posedge clk);
    $finish;
end
endmodule
