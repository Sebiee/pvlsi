module counter4(input [3:0] data,
input up_down,
input enable,
input load,
input clock,
input reg reset,
output reg [3:0] result, output reg terminal_count);

always @(reset) begin

  if(reset == 0)
  begin
    result = 0;
  end

end

always @(data or clock) begin

  if(enable == 1) begin
    if(load == 1) begin
      result = data;
    end
    else begin
      if(up_down == 1) begin
        result = result + 1;
      end
      else begin
        result = result - 1;
      end
    end
  end

end

always @(terminal_count) begin

  if(result == 15) begin
    terminal_count = 1;
  end

end

endmodule

module test_counter4();
reg [3:0] data;
reg up_down;
reg enable;
reg load;
reg clock;
reg reset;
wire [3:0] result, terminal_count;

counter4 my_counter(data, up_down, enable, load, clock, reset, result, terminal_count);

initial begin
  clock = 0;
  enable = 1;
  load = 1;
  reset = 1;
  up_down = 1;
  data = 5;

  #20
  load = 0;
  forever
    #5 clock = ~clock;

end


endmodule
