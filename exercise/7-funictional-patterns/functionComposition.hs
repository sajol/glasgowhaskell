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


myPrint :: (Show a) => a -> IO ()
myPrint a = (putStrLn . show) a

pointFreePrint :: (Show a) => a -> IO ()
pointFreePrint = putStrLn . show


--exercise : lets write code
--1

tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = (fst . divMod x) 10
          d = xLast `mod` 10

--2
foldBool :: a -> a -> Bool -> a
foldBool x y z =
    case z of
        True -> x
        False -> y

--pattern matching version
foldBool3 :: a -> a -> Bool -> a
foldBool3 x y True = x
foldBool3 x y False = y



--3
g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)


--4
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

exercise4executor =
    do
        print (roundTrip 4)
        print (id 5)


--point free
roundTrip' :: (Show a, Read a) => a -> a
roundTrip' = read . show

exercise4executor' =
    do
        (print . roundTrip') 4
        (print . id) 5


roundTrip'' :: (Show a, Read b) => a -> b
roundTrip'' = read . show
--ex : roundTrip'' 1 :: Integer