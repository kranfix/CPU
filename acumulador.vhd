library ieee;
use ieee.std_logic_1164.all;

entity acumulador is
port(
    -- Inputs
    clk,r,p,ff_E: in std_logic;
    B,D: in std_logic_vector(7 downto 0);
    ALU,T: in std_logic_vector(15 downto 0);
    -- Outpus
    AC: out std_logic_vector(15 downto 0)
);
end entity;

architecture acumular of acumulador is

end acumular;
