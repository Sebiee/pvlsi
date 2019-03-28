module codificator8(I, C);
input [7:0] I;
output reg [2:0] C;
integer k;
always @(I) begin
for(k = 0; k <= 7; k = k+1)
  if(I[k] == 1)
    C = k;
end
endmodule

module test_codificator8;
reg [7:0] I;
wire [2:0] C;
integer i;

codificator8 my_cod(I,C);
initial begin
  I = 0;
  for(i=0; i<=7; i=i+1)
  begin
    I = 2**i;
    #20;
  end
end
endmodule
