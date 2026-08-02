module shift_register (input clk,
        input rst,
        input load,
        input [7:0] parallel_in,
        output serial_out);
    reg [7:0] shift_data;
    always @(posedge clk or negedge rst) begin 
        if(!rst)
        shift_data <= 0;
        else if (load)
        shift_data <= parallel_in;
        else
        shift_data <= { shift_data[6:0], 1'b0};
    end
    assign serial_out = shift_data[7];
endmodule
