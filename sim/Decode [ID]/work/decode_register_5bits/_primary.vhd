library verilog;
use verilog.vl_types.all;
entity decode_register_5bits is
    port(
        WriteRegister   : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        Register_num    : out    vl_logic_vector(31 downto 0)
    );
end decode_register_5bits;
