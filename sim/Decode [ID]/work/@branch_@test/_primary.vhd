library verilog;
use verilog.vl_types.all;
entity Branch_Test is
    generic(
        SB_OPCODE       : integer := 99;
        BEQ_funct3      : integer := 0;
        BNE_funct3      : integer := 1;
        BLT_funct3      : integer := 4;
        BGE_funct3      : integer := 5;
        BLTU_funct3     : integer := 6;
        BGEU_funct3     : integer := 7
    );
    port(
        rs1Data         : in     vl_logic_vector(31 downto 0);
        rs2Data         : in     vl_logic_vector(31 downto 0);
        SB_type_judge   : in     vl_logic_vector(6 downto 0);
        funct3_judge    : in     vl_logic_vector(2 downto 0);
        Branch          : out    vl_logic
    );
end Branch_Test;
