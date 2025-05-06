`timescale 1ns / 1ps

module task1_tb;

    parameter WIDTH = 16;
    reg clk, rst, in_val;
    reg signed [WIDTH-1:0] a, b, c, d;
    wire signed [WIDTH-1:0] Q;
    wire out_val;

    task1 #(.WIDTH(WIDTH)) u1 (
        .clk(clk),
        .rst(rst),
        .in_val(in_val),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .Q(Q),
        .out_val(out_val)
    );

    always #5 clk = ~clk;

    initial begin
	 
        clk = 0;
        rst = 1;
        in_val = 0;
        a = 0; b = 0; c = 0; d = 0;

        #10;
        rst = 0;

        #10;
        in_val = 1;
        a = 10;
        b = 2;
        c = 1;
        d = 3;

        #10;
        in_val = 0;

        wait(out_val);
        #10;
		  
        in_val = 1;
        a = -5;
        b = 2;
        c = 3;
        d = 1;

        #10;
        in_val = 0;

        wait(out_val);
        #10;

        $finish;
    end

endmodule
