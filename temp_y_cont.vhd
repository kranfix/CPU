library ieee;
use ieee.std_logic_1164.all;

entity temp_y_cont is
port(
    -- Inputs
    clk,ff_R,ff_I,ff_S: in std_logic;
    IR: in std_logic_vector(15 downto 0)
    -- Outputs
    r,p,clrcont,incrcont: out std_logic;
    SC_cnt: out std_logic_vector(3 downto 0);
    T: out std_logic_vector(5 downto 0);
    D: out std_logic_vector(7 downto 0)
);
end entity;

architecture temporizar of temp_y_cont is
begin
end temporizar;
