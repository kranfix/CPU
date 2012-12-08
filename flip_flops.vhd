library ieee;
use ieee.std_logic_1164.all;

entity flip_flops is
port(
    -- Inputs
    clk,Cout,rm,p,LD_FGI,LD_FGO: in std_logic;
    INPR: in std_logic_vector(7 downto 0);
    B: in std_logic_vector(11 downto 0);
    IR,AC,T: in std_logic_vector(15 downto 0);
    -- Outputs
    FGI,FGO,ff_E,ff_I,IEN,ff_S,ff_R: out std_logic;
);
end entity;

architecture ff of flip_flops is
begin
end ff;
