library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vote_tb is end vote_tb;

architecture Behavorial of vote_tb is

    component vote2 is
        port (
            votes : in std_logic_vector(3 downto 0);
            res : out std_logic
        );
    end component vote2;

    signal inputs : std_logic_vector(3 downto 0);
    signal res : std_logic;

begin
    uut : vote2 port map (votes => inputs, res => res);

    vote2_process : process
    begin
        for i in 0 to 15 loop
            inputs <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        wait;
    end process ; -- vote2_process

end Behavorial ; -- Behavorial