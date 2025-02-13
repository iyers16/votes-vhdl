library ieee;
use ieee.std_logic_1164.all;

entity vote1 is 

port (
    a : in std_logic;
    b : in std_logic;
    c : in std_logic;
    d : in std_logic;
    res : out std_logic
);
end vote1;

architecture Behavorial of vote1 is

signal w1: std_logic;
signal w2: std_logic;
signal w3: std_logic;
signal w4: std_logic;

begin
    w1 <= a and c and d;
    w2 <= a and b and d;
    w3 <= a and b and c;
    w4 <= b and c and d;
    res <= w1 or w2 or w3 or w4;
end Behavorial;