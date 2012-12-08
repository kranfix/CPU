library ieee;
use ieee.std_logic_1164.all;

entity bus_comun is
port(
    -- Inputs
    r,p,FGI,FGO,IEN,ff_E,ff_R,ff_I: in std_logic;
    D: in std_logic_vector(7 downto 0);    
    B,AR,PC: in std_logic_vector(11 downto 0);
    T,DR,AC,IR,TR,data_out: in std_logic_vector(15 downto 0);    
    -- Outputs
    wr_mem: out std_logic;
    buscomun: out std_logic_vector(15 downto 0)
);
end entity;

architecture comun of bus_comun is
begin
end comun;
