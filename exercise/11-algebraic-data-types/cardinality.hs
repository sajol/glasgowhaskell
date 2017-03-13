module Cardinality where

data PugType = PugData

--1. cardinality 1

data Airline = PapuAir
             | CatapultsR'US
             | TakeYourChancesUnited

--2. cardinality 3


--3. What is the cardinality of Int16

-- maxBound = -32768 minBound = 32767
-- cardinality = 32768 + 32767 + 1 = 65536

--4. Use the REPL and maxBound and minBound to examine Int and
--Integer . What can you say about the cardinality of those types?

-- Cardinality of Int can be determined. It has instance of Bounded. Integer doesn't have bounds


--5. Extra credit (impress your friends!): What’s the connection
--between the 8 in Int8 and that type’s cardinality of 256?

-- It seems 256 = 2 ^ 8


