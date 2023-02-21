module full_adder (
    A, B, cin, sum, cout
);
    input A, B, cin;
    output sum, cout;
    wire wire1, wire2, wire3;

    xor (wire1, A, B);
    xor (sum, wire1, cin);
    and (wire2, wire1, cin);
    and (wire3, A, B);
    or (cout, wire2, wire3);
endmodule