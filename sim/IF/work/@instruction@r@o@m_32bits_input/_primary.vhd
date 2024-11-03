library verilog;
use verilog.vl_types.all;
entity InstructionROM_32bits_input is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        dout            : out    vl_logic_vector(31 downto 0)
    );
end InstructionROM_32bits_input;
