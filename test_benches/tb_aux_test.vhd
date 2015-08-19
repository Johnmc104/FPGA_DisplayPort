library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_aux_test is
end entity;

architecture arch of tb_aux_test is
	component aux_test is 
		port (
			clk    : in    std_logic;  -- Needs to be a 100 MHz signal 
    		debug_pmod  : out   std_logic_vector(7 downto 0);
            dp_tx_aux_p : inout std_logic;
            dp_tx_aux_n : inout std_logic;
            dp_rx_aux_p : inout std_logic;
            dp_rx_aux_n : inout std_logic;
            dp_tx_hpd   : in    std_logic 
		);
	end component;

	signal clk         : std_logic := '0';
	signal debug_pmod  : std_logic_vector := (others => '0');
    signal dp_tx_aux_p : std_logic := '0';
    signal dp_tx_aux_n : std_logic := '0';
    signal dp_rx_aux_p : std_logic := '0';
    signal dp_rx_aux_n : std_logic := '0';
    signal dp_tx_hpd   : std_logic := '0';
begin

uut: aux_test PORT MAP (
		clk    => clk,
	    debug_pmod  => debug_pmod,
        dp_tx_aux_p => dp_tx_aux_p,
        dp_tx_aux_n => dp_tx_aux_n,
        dp_rx_aux_p => dp_rx_aux_p,
        dp_rx_aux_n => dp_rx_aux_n,  
        dp_tx_hpd   => dp_tx_hpd  
	
	);

process
	begin
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
	end process;
end architecture;