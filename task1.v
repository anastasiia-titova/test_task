module task1 #(parameter WIDTH = 16)(
    input wire clk, rst, in_val,
    input wire signed [WIDTH-1:0] a, b, c, d,
    output reg signed [WIDTH-1:0] Q,
    output reg out_val
);

    wire signed [2*WIDTH-1:0] sub_ab = a - b;
    wire signed [2*WIDTH-1:0] mult_3c = 3 * c;
    wire signed [2*WIDTH-1:0] sum1_3c = 1 + mult_3c;
    wire signed [2*WIDTH-1:0] mult = sub_ab * sum1_3c;
    wire signed [2*WIDTH-1:0] mult_4d = 4 * d;
    wire signed [2*WIDTH-1:0] sub = mult - mult_4d;
    wire signed [2*WIDTH-1:0] rez = sub >>> 1;

    always @(posedge clk) begin
        if (rst) begin
            Q <= 0;
            out_val <= 0;
        end else if (in_val) begin
            Q <= rez[WIDTH-1:0];
            out_val <= 1;
        end else begin
            out_val <= 0;
        end
    end

endmodule
