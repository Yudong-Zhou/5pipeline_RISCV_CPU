library verilog;
use verilog.vl_types.all;
entity Type_judgement is
    port(
        Instruction     : in     vl_logic_vector(31 downto 0);
        rdAddr          : out    vl_logic_vector(4 downto 0);
        rs1Addr         : out    vl_logic_vector(4 downto 0);
        rs2Addr         : out    vl_logic_vector(4 downto 0);
        funct3          : out    vl_logic_vector(2 downto 0);
        opcode          : out    vl_logic_vector(6 downto 0)
    );
end Type_judgement;
