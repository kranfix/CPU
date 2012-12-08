library ieee;
use ieee.std_logic_1164.all;

entity registros_8 is
port(
    -- INPUTS
    clk,p,LD_INPR: in std_logic;
    IN_INPR,IN_OUTR: in std_logic_vector(7 downto 0);
    -- Outputs
    INPR,OUTR: out std_logic_vector(7 downto 0)
);
end entity;

architecture registrar of registros_8 is

end registrar;
