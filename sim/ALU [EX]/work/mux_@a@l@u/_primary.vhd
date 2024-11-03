library verilog;
use verilog.vl_types.all;
entity mux_ALU is
    generic(
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
        addr            : in     vl_logic_vector(3 downto 0);
        d0_1            : in     vl_logic_vector(31 downto 0);
        d2              : in     vl_logic_vector(31 downto 0);
        d3              : in     vl_logic_vector(31 downto 0);
        d4              : in     vl_logic_vector(31 downto 0);
        d5              : in     vl_logic_vector(31 downto 0);
        d6              : in     vl_logic_vector(31 downto 0);
        d7              : in     vl_logic_vector(31 downto 0);
        d8              : in     vl_logic_vector(31 downto 0);
        d9              : in     vl_logic;
        d10             : in     vl_logic;
        ALUResult       : out    vl_logic_vector(31 downto 0)
    );
end mux_ALU;
