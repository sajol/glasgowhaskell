module Newtype where


tooManyGoats' :: Int -> Bool
tooManyGoats' n = n > 42


newtype Goats = Goats Int deriving (Eq, Show)
newtype Cows = Cows Int deriving (Eq, Show)

-- Now we can rewrite our type to be
-- safer, pattern matching in order
-- to access the Int inside our data
-- constructor Goats.

tooManyGoats :: Goats -> Bool
tooManyGoats (Goats n) = tooManyGoats' n


class TooMany a where
    tooMany :: a -> Bool


instance TooMany Int where
    tooMany n = n > 42


--under the hood goat is still Int  but newtype declaration will allow to define a custom instance

instance TooMany Goats where
    tooMany (Goats n) = n > 43
