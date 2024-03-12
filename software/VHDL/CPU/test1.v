module test1(in1, vect, out1);

input in1;
input [1:0] vect;
output out1;

assign out1 = in1 | (vect);

endmodule