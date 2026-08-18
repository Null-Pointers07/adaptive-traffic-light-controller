module duration_decoder (input [5:0] density,
                         output reg [5:0] duration);
    always @(*) begin
    if(density<=20)
    duration = 30;
    else if (density<=40)
    duration = 45;
    else if (density>40)
    duration = 60;
    end
endmodule
