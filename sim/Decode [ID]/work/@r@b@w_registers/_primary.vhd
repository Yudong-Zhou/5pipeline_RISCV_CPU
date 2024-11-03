library verilog;
use verilog.vl_types.all;
entity RBW_registers is
    port(
        clk             : in     vl_logic;
        rs1Addr         : in     vl_logic_vector(4 downto 0);
        rs2Addr         : in     vl_logic_vector(4 downto 0);
        WriteAddr       : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        WriteData       : in     vl_logic_vector(31 downto 0);
        rs1Data         : out    vl_logic_vector(31 downto 0);
        rs2Data         : out    vl_logic_vector(31 downto 0)
    );
end RBW_registers;
