// Se acrescer soma 1
// Se decrescer diminui 1
// se acressecer e decrescer mesmo
// Load = 0x6A

module Contador (
    input  wire clk,
    input  wire rst_n,

    input  wire acrescer,
    input  wire decrecer,

    output reg [7:0] saida
);


wire [7:0] carga;
assign carga = 8'h6A;


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        saida <= carga;
    end
    else begin
        if (saida == 8'hFF)begin
            saida <= carga;
        end
        else if ((acrescer && decrecer) || (~acrescer && ~decrecer))begin // 11 ou 00
            saida <= saida;
        end
        else if (acrescer) begin
            saida <= saida + 1;
        end
        else if (decrecer) begin
            saida <= saida -1;
        end
    end
end

endmodule
