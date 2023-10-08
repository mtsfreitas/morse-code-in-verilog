module numero(
  entrada,
  reset,
  ready,
  saida
);

input wire [3:0] entrada;
input wire 		 reset;
input wire 		 ready;
output reg [4:0] saida;

//entrada[0] = D;
//entrada[1] = C;
//entrada[2] = B;
//entrada[3] = A;

initial begin
	saida = 5'b01010; // inicializando... É o mesmo valor para quando reset = 1.
end

always @ (posedge ready or posedge reset) begin
	if(reset) begin
		saida = 5'b01010;
	end
	else begin
		saida[4] = (~entrada[1] & (entrada[2] | (~entrada[3] & entrada[0]))) | (~entrada[2] & entrada[1]);
		saida[3] = (entrada[2] & (~entrada[1] | ~entrada[0])) | (~entrada[2] & entrada[1]);
		saida[2] = entrada[2] | (entrada[1] & entrada[0]);
		saida[1] = entrada[2] | (entrada[3] & ~entrada[0]);
		saida[0] = entrada[2] & (entrada[0] | entrada[1]) | entrada[3];
	end	
end







endmodule
