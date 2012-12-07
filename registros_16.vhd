library ieee;
use ieee.std_logic_1164.all;

entity registros_16 is
port(
    -- Inputs
    clk,ff_R: in std_logic;
    D: in std_logic_vector(7 downto 0);
    T,IN_DR,IN_TR,IN_AR: in std_logic_vector(15 downto 0);
    -- Outputs
    DR,IR,TR: out std_logic_vector(15 downto 0)
);
end entity;

architecture registrar of registros_16 is

end registrar;
