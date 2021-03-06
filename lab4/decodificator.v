module decodificator3(A, E, Y);
input [2:0] A;
output reg [7:0] Y;
input E;
integer i;

always @(A or E) begin

if(E == 1)
  Y = 0;
else
  for(i = 0; i < 8; i = i+1)
    Y[i] = 0;
  Y[A] = 1;
end

endmodule

module test_decodificator3;
reg [2:0] A;
wire [7:0] Y;
reg E;
integer i;

decodificator3 mydecode(A, E, Y);
initial begin
  E = 1;
  #20 E = 0;
  for(i = 0; i < 8; i = i+1) begin
    A = i;
    #10;
  end
end
endmodule
