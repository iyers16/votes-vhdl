library ieee;
use ieee.std_logic_1164.all;

entity vote2 is
    port (
        votes : in std_logic_vector(3 downto 0);
        res : out std_logic
    );
end vote2;

architecture Behavorial of vote2 is

begin
    with votes select
        res <=
            '1' when "0111",
            '1' when "1011",
            '1' when "1101",
            '1' when "1110",
            '1' when "1111",
            '0' when others;
end Behavorial ; -- Behavorial

-- 7, 11, 13, 14, 15