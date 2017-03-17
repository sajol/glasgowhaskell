{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module GeneralizedNewTypeDeriving where

class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)


--intemission:exercise

--1.Reusing the TooMany typeclass, write an instance of the typeclass
--for the type (Int, String) . This will require adding a language
--pragma named FlexibleInstances

--without newtype pragma is required
instance TooMany (Int, String) where
    tooMany (n , s) = tooMany n

--with newtype pragma is not required
newtype Goats' = Goats' (Int, String) deriving (Eq, Show)

instance TooMany Goats' where
    tooMany (Goats' (n, s)) = n > 42


--2.Make another TooMany instance for (Int, Int) . Sum the values
--together under the assumption this is a count of goats from two
--fields.

newtype Goats'' = Goats'' (Int, Int) deriving (Eq, Show)

instance TooMany Goats'' where
    tooMany (Goats'' (n, n')) = (n + n') > 42


--3.Make another TooMany instance, this time for (Num a, TooMany a) => (a, a).
--This can mean whatever you want, such as summing the two numbers together.

instance (Num a, TooMany a) => TooMany (a,a) where
    tooMany (n, n') = tooMany (n + n')







