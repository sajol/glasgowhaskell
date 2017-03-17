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


-- Simple datatypes with nullary data constructors

data Example = MakeExample deriving Show

--1. What is the type of data constructor MakeExample ?
--What happens when you request the type of Example ?

--type of MakeExample : Example
--Not in scope: data constructor ‘Example’


--2.What if you try :info on Example in GHCi?
--Can you determine what typeclass instances are defined
--for the Example type using :info in GHCi?

-- info shows that it is instance of Show type class


--3.Try making a new datatype like Example but with a single
--type argument added to MakeExample , such as Int .
-- What has changed when you query MakeExample with :type in GHCi?

data Example1 = MakeExample1 Int deriving Show

-- :t MakeExample1 will give Int -> Example