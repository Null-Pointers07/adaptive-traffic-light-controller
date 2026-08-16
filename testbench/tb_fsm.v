module tb_fsm;
reg clk, rst, done;
reg [5:0] duration;
wire load;
wire [5:0] load_value;
wire [1:0] state;

FSM dut ( .clk(clk), .rst(rst), .done(done), .duration(duration), .load(load), .load_value(load_value), .state(state));

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_fsm);
    $monitor("T=%0t rst=%0b done=%0b duration=%0d state=%0b load=%0b load_value=%0d", $time, rst, done, duration, state, load, load_value);

    clk = 0;
    rst = 0;
    done = 0;
    duration = 0;
    #10 rst = 1;

    // RED -> YELLOW
    duration = 10;
    @(posedge clk);
    done = 1;
    @(posedge clk);
    done = 0;

    // YELLOW -> GREEN
    duration = 30;
    @(posedge clk);
    done = 1;
    @(posedge clk);
    done = 0;

    // GREEN -> RED
    duration = 60;
    @(posedge clk);
    done = 1;
    @(posedge clk);
    done = 0;

    $finish;
end
endmodule

// module tb_fsm;
// reg clk, rst, done;
// reg [5:0] duration;
// wire load;
// wire [5:0] load_value;
// wire [1:0] state;
// wire [1:0] next_state;

// FSM dut ( .clk(clk), .rst(rst), .done(done), .duration(duration), .load(load), .load_value(load_value), .state(state));

// always #5 clk = ~clk;

// initial begin
//     $dumpfile("dump.vcd");
//     $dumpvars(0, tb_fsm);
//     $monitor("T=%0t rst=%0b done=%0b duration=%0d state=%0b load=%0b load_value=%0d", $time, rst, done, duration, state, load, load_value);

//     clk <= 0;
//     rst <= 0;
//     done = 0;
//     duration = 0;
//     #10 rst <= 1;

//     duration = 10;
//     #10 done = 1;
//     #10 done = 0;

    
//     duration = 30;
//     #10 done = 1;
//     #10 done = 0;

    
//     duration = 60;
//     #10 done = 1;
//     #10 done = 0;

//     $finish;
// end
// endmodule

