module alu(f, m, cin, a, b, o, cout, e);
input [3:0] f, a, b;
input m, cin;
output reg [3:0] o;
output reg cout, e;

always @(*) begin

  if(m == 1) begin
    case(f)
      0: o = ~ a;
      1: o = ~(a | b);
      2: o = ~a & b;
      3: o = 0;
      4: o = ~(a | b);
      5: o = ~b;
      6: o = a ^ b;
      7: o = a & ~b;
      8: o = ~a | b;
      9: o = ~(a ^ b);
      10: o = b;
      11: o = a & b;
      12: o = 1;
      13: o = a | ~b;
      14: o = a | b;
      15: o = a;
      default: o = 0;
    endcase
  end
  else
    case(f)
      0: {cout,o} = a + cin;
      1: {cout,o} = a | b + cin;
      2: {cout,o} = a | ~b + cin;
      3: {cout,o} = -1 + cin;
      4: {cout,o} = a + a | ~b + cin;
      5: {cout,o} = (a | b) + (a & ~b) + cin;
      6: {cout,o} = a - b + cin - 1;
      7: {cout,o} = a & ~b - 1 + cin;
      8: {cout,o} = a + (a & b) + cin;
      9: {cout,o} = a + b + cin;
      10: {cout,o} = (a | ~b) + (a & b) + cin;
      11: {cout,o} = (a & b) - 1 + cin;
      12: {cout,o} = a + a + cin;
      13: {cout,o} = (a | b) + a + cin;
      14: {cout,o} = (a | ~b) + a + cin;
      15: {cout,o} = a - 1 + cin;
      default: o = 0;
    endcase
  if( a == b) e = 1;
  else e = 0;
end
endmodule

module test_alu;
reg [3:0] f, a, b;
reg m, cin;
wire [3:0] o;
wire cout, e;
integer i;

alu my_alu(f, m, cin, a, b, o, cout, e);
initial begin

  a = 2; b = 3;
  m = 1;
  cin = 0;
  for(i = 0; i <= 15; i = i+1) begin
    f = i; #20;
  end
  m = 0;
  for(i = 0; i <= 15; i = i+1) begin
    f = i; #20;
  end

end

endmodule
