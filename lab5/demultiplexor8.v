module demultiplexor8(E, A, D, Y);
input [2:0] A;
output reg [7:0] Y;
input D, E;
integer k;

always @(E or A or D) begin

  for(k = 0; k <= 7; k = k+1) begin
    if( E == 1)
      Y = 0;
    else if( k == A)
      Y[k] = D;
    else
      Y[k] = 0;
    
  end

end
endmodule

module test_demultiplexor8;
reg [2:0] A;
wire [7:0] Y;
reg D, E;
integer k;

demultiplexor8 my_dmux(E, A, D, Y);
initial begin
  D = 1;
  E = 0;
  for(k = 0; k <= 7; k = k+1) begin
    A = k; #20;
  end
  E = 1;
end
endmodule

