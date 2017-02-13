module FunctionComposition where

addThenNegate = negate . sum $ [1..10]

reverseThenTakeFirstFiveElements = take 5 . reverse $ [1..10]

takeFirstFiveFromEnumFrom3 = take 5 . enumFrom $ 3

takeFirstFiveFromEnumFromN n = take 5 . enumFrom $ n


takeFirstFiveOddFromEnumFromN n = take 5 . filter odd . enumFrom $ n


add :: Int -> Int -> Int
add x y = x + y

addPF :: Int -> Int -> Int
addPF = (+)

addOne :: Int -> Int
addOne = \x -> x + 1

addOnePF :: Int -> Int
addOnePF = (+1)


main :: IO ()
main = do
    print (0 :: Int)
    print (add 1 0)
    print (addOne 0)
    print (addOnePF 0)
    print ((addOne . addOne) 0)
    print ((addOnePF . addOne) 0)
    print ((addOne . addOnePF) 0)
    print ((addOnePF . addOnePF) 0)
    print (negate (addOne 0))
    print ((negate . addOne) 0)
    print ((addOne . addOne . addOne . negate . addOne) 0)