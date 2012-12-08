library ieee;
use ieee.std_logic_1164.all;

entity memoria is
port(
    -- Inputs
    clk,wr_mem: in std_logic;
    ram_add: in std_logic_vector(11 downto 0); 
    data_in: in std_logic_vector(15 downto 0); 
    -- Outputs
    data_out: out std_logic_vector(15 downto 0);
);
end entity;
