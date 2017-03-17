module Sumtype where

import Data.Int

data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

--1.What is the cardinality of this datatype?
--cardinality is = 4
-- cardinality for Bool is 2
-- for big and small 2 + 2 = 4

data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)

--2.What is the cardinality of NumberOrBool ?
-- 258
-- 2 for Bool and 256 for Int8
