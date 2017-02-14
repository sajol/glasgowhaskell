module PatternMatching where

data Identity a = Identity a deriving (Show, Eq)

unpackIdentity :: Identity a -> a
unpackIdentity (Identity x) = x

ignoreIdentity :: Identity a -> Bool
ignoreIdentity (Identity _) = True

ignoreIdentity' :: Identity a -> Bool
ignoreIdentity' _ = True


data Product a b =
    Product a b deriving (Eq, Show)

productUnpackOnlyA :: Product a b -> a
productUnpackOnlyA (Product x _) = x

productUnpackOnlyB :: Product a b -> b
productUnpackOnlyB (Product _ y) = y

productUnpack :: Product a b -> (a, b)
productUnpack (Product x y) = (x,y)


data SumOfThree a b c = FirstPossible a
                      | SecondPossible b
                      | ThirdPossible c


sumToInt :: SumOfThree a b c -> Integer
sumToInt (FirstPossible _)  = 0
sumToInt (SecondPossible _) = 1
sumToInt (ThirdPossible _)  = 2


sumToInt' :: SumOfThree a b c -> Integer
sumToInt' (FirstPossible _) = 0
sumToInt' _                 = 1


