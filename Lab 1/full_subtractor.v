module full_subtractor (
    A, B, cin, diff, cout
);
    input A, B, cin;
    output diff, cout;
    wire wire1, wire2, wire3, wire4, sire5, wire6;

    xor(wire1, A, B);
    xor(diff, wire1, cin);
    and(wire2, wire1, bin);
    not(wire3, A);
    and(wire4, wire3, B);
    and(wire5, wire3, cin);
    not(wire6, wire1);
    or(cout, wire2, wire4, wire5, wire6);
endmodule