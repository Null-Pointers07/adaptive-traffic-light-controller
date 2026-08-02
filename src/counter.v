module counter(
    input clk,
    input rst,
    input load,
    input [5:0] load_value,
    input enable,
    output reg [5:0] count, 
    output wire done
  );
  always @(posedge clk) begin
  if (rst)
  count<=6'b0;
  else if (load)
  count<=load_value;
  else if (enable && count !=0)
  count<=count-1;
  end
  assign done=(count==0);
  endmodule
 