library verilog;
use verilog.vl_types.all;
entity mux_2to1 is
    generic(
        n               : integer := 4
    );
    port(
        \out\           : out    vl_logic_vector;
        in0             : in     vl_logic_vector;
        in1             : in     vl_logic_vector;
        addr            : in     vl_logic
    );
end mux_2to1;
