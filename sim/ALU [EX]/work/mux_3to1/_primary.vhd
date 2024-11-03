library verilog;
use verilog.vl_types.all;
entity mux_3to1 is
    generic(
        n               : integer := 32
    );
    port(
        \out\           : out    vl_logic_vector;
        in0             : in     vl_logic_vector;
        in1             : in     vl_logic_vector;
        in2             : in     vl_logic_vector;
        addr            : in     vl_logic
    );
end mux_3to1;
