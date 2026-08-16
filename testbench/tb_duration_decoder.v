module tb;
reg [5:0] density;
wire [5:0] duration;
integer i;

alu u0 ( .density(density), .duration(duration) );

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    density <= 0;

$monitor ("density = %b, duration = %b", density, duration);

for (i=0; i<64; i++) begin
    density = i;
    #10;
end
$finish;
end
endmodule