library ieee;
use ieee.std_logic_1164.all;

entity cpu is
port(
    -- Inputs
    clk: in std_logic_vector(2 downto 0);
    -- Outputs
);
end entity;

architecture cetral of cpu is
    signal r,p: std_logic;
    signal FGI,FGO,ff_E,ff_I,IEN,ff_S,ff_R: std_logic;
    signal: std_logic_vector(7 downto 0);
    signal B: std_logic_vector(11 downto 0);
	signal DR,IR,TR: std_logic_vector(15 downto 0);
    
    component registros_16
		port(
			-- Inputs
			clk,ff_R: in std_logic;
			D: in std_logic_vector(7 downto 0);
			T,IN_DR,IN_TR,IN_AR: in std_logic_vector(15 downto 0);
			-- Outputs
			DR,IR,TR: out std_logic_vector(15 downto 0)
		);
	end component;
	
	component registros_12
		port(
			-- Inputs
			clk,ff_E,ff_R,r,FGI,FGO,p,ff_I: in std_logic;
			D: in std_logic_vector(7 downto 0);
			IN_AR,IN_PC,B: in std_logic_vector(11 downto 0);
			AC,DR,T: std_logic_vector(15 downto 0);
			-- Outputs
			AR,PC: out std_logic_vector(11 downto 0);
		);
	end component;
	
	component registros_8
		port(
			-- INPUTS
			clk,p,LD_INPR: in std_logic;
			IN_INPR,IN_OUTR: in std_logic_vector(7 downto 0);
			-- Outputs
			INPR,OUTR: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component acumulador
		port(
			-- Inputs
			clk,r,p,ff_E: in std_logic;
			B,D: in std_logic_vector(7 downto 0);
			ALU,T: in std_logic_vector(15 downto 0);
			-- Outputs
			AC: out std_logic_vector(15 downto 0)
		);
	end component;

	component suma_log
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
	end component;

	component temp_y_cont
		port(
			-- Inputs
			clk,ff_R,ff_I,ff_S: in std_logic;
			IR: in std_logic_vector(15 downto 0)
			-- Outputs
			r,p,clrcont,incrcont: out std_logic;
			SC_cnt: out std_logic_vector(3 downto 0);
			T: out std_logic_vector(5 downto 0);
			D: out std_logic_vector(7 downto 0);
			B: out std_logic_vector(11 downto 0)
		);
	end component;

	component flip_flops
		port(
			-- Inputs
			clk,Cout,rm,p,LD_FGI,LD_FGO: in std_logic;
			INPR: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(11 downto 0);
			IR,AC,T: in std_logic_vector(15 downto 0);
			-- Outputs
			FGI,FGO,ff_E,ff_I,IEN,ff_S,ff_R: out std_logic;
		);
	end component;

	component bus_comun
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
	end component;
	
	component memoria
		port(
			-- Inputs
			clk,wr_mem: in std_logic;
			ram_add: in std_logic_vector(11 downto 0); 
			data_in: in std_logic_vector(15 downto 0); 
			-- Outputs
			data_out: out std_logic_vector(15 downto 0);
		);
	end component;

begin

R16: registros_16 port map(
	clk,ff_R, 						-- in std_logic
	D, 								-- in std_logic_vector(7 downto 0)
	T,IN_DR,IN_TR,IN_AR,			-- in std_logic_vector(15 downto 0)
	DR,IR,TR						-- out std_logic_vector(15 downto 0)
);

R12: registros_12 port map(
	clk,ff_E,ff_R,r,FGI,FGO,p,ff_I,	-- in std_logic;
	D,								-- in std_logic_vector(7 downto 0)
	IN_AR,IN_PC,B,  				-- in std_logic_vector(11 downto 0)
	AC,DR,T,						-- in std_logic_vector(15 downto 0)
	AR,PC							-- out std_logic_vector(11 downto 0)
);

R8: registros_8 port map(
	clk,p,LD_INPR, 					-- in std_logic;
	IN_INPR,IN_OUTR					-- in std_logic_vector(7 downto 0)
	INPR,OUTR						-- out std_logic_vector(7 downto 0)
);

acum: acumulador port map(
	clk,r,p,ff_E					-- in std_logic;
	B,D, 							-- in std_logic_vector(7 downto 0)
	ALU,T,							-- in std_logic_vector(15 downto 0)
	AC								-- out std_logic_vector(15 downto 0)
);

SL: suma_log port map(
	p								-- in std_logic;
	INPR,D							-- in std_logic_vector(7 downto 0);
	B								-- in std_logic_vector(11 downto 0);
	DR,AC,T							-- in std_logic_vector(15 downto 0);
	Cout							-- out std_logic;
	ALU 							-- out std_logic_vector(15 downto 0)
);

TC: temp_y_cont port map(
	clk,ff_R,ff_I,ff_S,				-- in std_logic;
	IR,								-- in std_logic_vector(15 downto 0)
	r,p,clrcont,incrcont,			-- out std_logic
	SC_cnt,							-- out std_logic_vector(3 downto 0)
	T,								-- out std_logic_vector(5 downto 0)
	D,								-- out std_logic_vector(7 downto 0)
	B								-- out std_logic_vector(11 downto 0)
);

FF: flip_flops port map(
	clk,Cout,rm,p,LD_FGI,LD_FGO,	-- in std_logic;
	INPR,							-- in std_logic_vector(7 downto 0);
	B,								-- in std_logic_vector(11 downto 0);
	IR,AC,T,						-- in std_logic_vector(15 downto 0);
	FGI,FGO,ff_E,ff_I,IEN,ff_S,ff_R	-- out std_logic;
);

BC: bus_comun port map(
	r,p,FGI,FGO,IEN,ff_E,ff_R,ff_I,	-- in std_logic;
	D,								-- in std_logic_vector(7 downto 0)    
	B,AR,PC,						-- in std_logic_vector(11 downto 0)
	T,DR,AC,IR,TR,data_out,			-- in std_logic_vector(15 downto 0)
	wr_mem,							-- out std_logic
	buscomun						-- out std_logic_vector(15 downto 0)
);

Mem: memoria port map(
	clk,wr_mem,						-- in std_logic
	ram_add,						-- in std_logic_vector(11 downto 0); 
	data_in,						-- in std_logic_vector(15 downto 0); 
	data_out						-- out std_logic_vector(15 downto 0);
);
end cpu;