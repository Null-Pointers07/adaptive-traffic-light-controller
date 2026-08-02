module FSM (input clk,
        input rst,
        input done,
        input [5:0] duration,
        output reg [5:0] load_value,
        output reg load,
        output reg [1:0] state);
    reg [1:0] next_state;
    parameter RED    = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN  = 2'b10;
always @(*)
begin
load = 0;
load_value = duration;
next_state = state;
    case (state)
    RED : if(done)begin 
            next_state = YELLOW;
            load = 1;
            load_value = 10;
        end
    YELLOW : if(done)begin 
            next_state = GREEN;
            load = 1;
        end
    GREEN : if(done)begin 
            next_state = RED;
            load = 1;
        end
    endcase
end
always @(posedge clk or negedge rst)
begin
    if (!rst)
        state <= RED;
    else
        state <= next_state;
end
endmodule