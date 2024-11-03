library verilog;
use verilog.vl_types.all;
entity D_trigger is
    generic(
        n               : integer := 32
    );
    port(
        d               : in     vl_logic_vector;
        en              : in     vl_logic;
        r               : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector
    );
end D_trigger;
