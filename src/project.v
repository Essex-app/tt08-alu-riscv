module tt_um_example (
    input  wire [7:0] ui_in,    // Entradas da ALU: A
    output wire [7:0] uo_out,   // Saída da ALU: Result
    input  wire [7:0] uio_in,   // Entradas da ALU: B
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    assign uio_oe  = 8'b00000000;
    assign uio_out = 8'b00000000;

    // Instância da sua ALU
    alu my_alu (
        .a(ui_in),
        .b(uio_in),
        .op(3'b000), // Soma
        .result(uo_out),
        .zero()
    );
endmodule

module alu (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [2:0] op,
    output reg  [7:0] result,
    output wire       zero
);
    always @(*) begin
        case (op)
            3'b000: result = a + b;
            3'b001: result = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = a ^ b;
            default: result = 8'b0;
        endcase
    end
    assign zero = (result == 8'b0);
endmodule
