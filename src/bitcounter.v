module bit_count (input clk,
                  input rst,
                  output reload,
                  output reg [2:0] b_counter);
    always @(posedge clk or negedge rst) begin
        if (!rst)
        b_counter <= 0;
        else if (b_counter == 7)
        b_counter <= 0;
        else 
        b_counter <= b_counter + 1;
    end
    assign reload = (b_counter == 7);
endmodule
    