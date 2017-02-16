
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

--1 fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty = cattyConny "woops"
--2 appedCatty "woohoo!" :  "woops mrow woohoo!"

frappe = flippy "haha"
--3 frappe "1" : "1 mrow haha"
--4 frappe (appedCatty "2") : "woops mrow 2 mrow haha"
--5 appedCatty (frappe "blue") : "woops mrow blue mrow haha"
--6 cattyConny (frappe "pink")
--      (cattyConny "green" (appedCatty "blue")) : "pink mrow haha mrow green mrow woops mrow blue"
--7 cattyConny (flippy "Pugs" "are") "awesome" : "are mrow Pugs mrow awesome"



--recursion exercise
--1
--Write a function that recursively sums all numbers from 1 to n,
--n being the argument. So that if n was 5, you’d add 1 + 2 + 3 + 4 +
--5 to get 15. The type should be (Eq a, Num a) => a -> a .

sumAllUpto :: (Eq a, Num a) => a -> a
sumAllUpto n = result 0 n
    where
        result r c
            | c == 0 = r
            | otherwise = result (r + c) (c - 1)


--2
--Write a function that multiplies two integral numbers using
--recursive summation. The type should be (Integral a) => a -> a -> a .

multiplyBy :: (Integral a) => a -> a -> a
multiplyBy a b = execute 0 1
    where
        execute result count
            | count > b = result
            | otherwise = execute (result + a) (count + 1)


--fixing divided by

data DividedResult = Result Integer | DividedByZero deriving Show

dividedByImproved :: Integer -> Integer -> DividedResult
dividedByImproved numerator denominator
    | denominator == 0 = DividedByZero
    | otherwise = execute (abs numerator) (abs denominator) 0
    where
        execute n d c
            | n < d = Result (c * negativeFactor)
            | otherwise = execute (n - d) d (c + 1)
            where negativeFactor
                      | factor == 0 = 0
                      | factor > 0 = 1
                      | otherwise = -1
                      where
                        factor = numerator * denominator
