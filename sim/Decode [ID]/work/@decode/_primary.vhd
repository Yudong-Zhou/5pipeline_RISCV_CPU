library verilog;
use verilog.vl_types.all;
entity Decode is
    generic(
        R_type_op       : integer := 51;
        I_type_op       : integer := 19;
        SB_type_op      : integer := 99;
        LW_op           : integer := 3;
        JALR_op         : integer := 103;
        SW_op           : integer := 35;
        LUI_op          : integer := 55;
        AUIPC_op        : integer := 23;
        JAL_op          : integer := 111;
        ADD_funct3      : integer := 0;
        SUB_funct3      : integer := 0;
        SLL_funct3      : integer := 1;
        SLT_funct3      : integer := 2;
        SLTU_funct3     : integer := 3;
        XOR_funct3      : integer := 4;
        SRL_funct3      : integer := 5;
        SRA_funct3      : integer := 5;
        OR_funct3       : integer := 6;
        AND_funct3      : integer := 7;
        ADDI_funct3     : integer := 0;
        SLLI_funct3     : integer := 1;
        SLTI_funct3     : integer := 2;
        SLTIU_funct3    : integer := 3;
        XORI_funct3     : integer := 4;
        SRLI_funct3     : integer := 5;
        SRAI_funct3     : integer := 5;
        ORI_funct3      : integer := 5;
        ANDI_funct3     : integer := 7;
        alu_add         : integer := 0;
        alu_sub         : integer := 1;
        alu_lui         : integer := 2;
        alu_and         : integer := 3;
        alu_xor         : integer := 4;
        alu_or          : integer := 5;
        alu_sll         : integer := 6;
        alu_srl         : integer := 7;
        alu_sra         : integer := 8;
        alu_slt         : integer := 9;
        alu_sltu        : integer := 10
    );
    port(
        MemtoReg        : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        ALUCode         : out    vl_logic_vector(3 downto 0);
        ALUSrcA         : out    vl_logic;
        ALUSrcB         : out    vl_logic_vector(1 downto 0);
        Jump            : out    vl_logic;
        JALR            : out    vl_logic;
        Imm             : out    vl_logic_vector(31 downto 0);
        offset          : out    vl_logic_vector(31 downto 0);
        Instruction     : in     vl_logic_vector(31 downto 0)
    );
end Decode;
