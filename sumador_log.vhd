library ieee;
use ieee.std_logic_1164.all;

entity sumador_log is
port(
    -- Inputs
    p: in std_logic;
    INPR,D: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(11 downto 0);
    DR,AC,T: in std_logic_vector(15 downto 0);
    -- Outputs
    Cout: out std_logic;
    ALU: out std_logic_vector(15 downto 0)
);
end entity;
15 downto 0
architecture sumar of sumador_log is
begin
end sumar;
