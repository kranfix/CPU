library ieee;
use ieee.std_logic_1164.all;

entity registros_12 is
port(
    -- Inputs
    clk,ff_E,ff_R,r,FGI,FGO,p,ff_I: in std_logic;
    D: in std_logic_vector(7 downto 0);
    IN_AR,IN_PC,B: in std_logic_vector(11 downto 0);
    AC,DR,T: std_logic_vector(15 downto 0);
    -- Outputs
    AR,PC: out std_logic_vector(11 downto 0);
);
end entity;

architecture registrar of registros_12 is

end registrar;
