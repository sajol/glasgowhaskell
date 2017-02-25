module StandardFunctions where


myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x : xs) = if x == False then False else myAnd xs



myAnd' :: [Bool] -> Bool
myAnd' [] = True
myAnd' (x : xs) = x && myAnd' xs



myOr :: [Bool] -> Bool
myOr [] = False
myOr (x : xs) =
    case x == True of
        True -> True
        _    -> myOr xs



myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x : xs) =
    case f x of
        True -> True
        _    -> myAny f xs
