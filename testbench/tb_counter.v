module tb_counter;
    reg clk, rst, load;
    reg [5:0] load_value;
    wire [5:0] count;
    wire done;

counter u0 ( .clk(clk), .rst(rst), .load(load), .load_value(load_value), .count(count), .done(done));

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_counter);
    $monitor("T=%0t rst=%0b load=%0b load_value=%0d count=%0d done=%0b", $time, rst, load, load_value, count, done);
    clk <= 0;
    rst <= 0;
    #10 rst <= 1;

    load = 1; load_value = 30;
    #10 load = 0;
    #300 load = 1; load_value = 45;
    #10 load = 0;
    #450 load = 1; load_value = 60;
    #10 load = 0;
    #600;
    $finish;
end
endmodule