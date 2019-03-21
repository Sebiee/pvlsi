module multiplexor4(D, E, S, Y);
input [3:0] D;
input [1:0] S;
output reg Y;
input E;

always @(D or S or E) begin

if (E == 1)
  Y=0;
else
  Y=D[S];
end
endmodule

module test_multiplexor4;
reg [3:0] D;
reg [1:0] S;
wire Y;
reg E;
integer i;

multiplexor4 mymux(D, E, S, Y);
initial begin
  E=1; D=6;
  #20;
  E=0;
  for(i = 0; i < 4; i = i+1) begin
    S = i;
    #10;
  end
end


endmodule
