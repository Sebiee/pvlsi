module comparator4(A,B,m,M,E);
input [3:0] A, B;
output reg m, M, E;
always @(A or B) begin
  if(A>B) begin
    M = 1; m = 0; E = 0;
  end
  else if (A == B) begin
    E = 1; M = 0; m = 0;
  end
  else begin
    m = 1; E = 0; M = 0;
  end
end
endmodule


module test_comparator4;
reg [3:0] A, B;
wire m, M, E;
comparator4 mycomp(A,B,m,M,E);
initial begin
  A = 5; B = 0;
  #20
  B = 5;
  #20
  B = 10;
end
endmodule

