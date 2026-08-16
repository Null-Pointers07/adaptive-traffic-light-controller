module shiftreg;
reg clk, rst, load;
reg [7:0] parallel_in;
wire serial_out;

shift_register dut ( .clk(clk), .rst(rst), .load(load), .parallel_in(parallel_in), .serial_out(serial_out) );

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars( 0 , shiftreg );
    $monitor("t=%0t rst=%b load=%b parallel_in=%b shift_data=%b serial_out=%b",
                  $time, rst, load, parallel_in, dut.shift_data, serial_out);
    clk <= 0;
    rst <=0;
    load = 0;
    parallel_in = 8'b00000000;
    #10 rst <= 1;
    
    load = 1; parallel_in = 8'b10101010;
    #10 load = 0;
    #70 load = 1; parallel_in = 8'b11110000;
    #10 load = 0;
    #70;
    $finish;

end
endmodule


