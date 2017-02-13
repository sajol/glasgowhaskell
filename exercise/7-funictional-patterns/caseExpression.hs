module CaseExpression where

{-if x + 1 == 1 then "AWESOME" else "wut"-}

funcZ x =
    case x + 1 == 1 of
        True -> "Awesome"
        False -> "wut"


isPalindrome xs =
    case xs == reverse xs of
        True -> "yes"
        False -> "no"


isPalindrome' xs =
    case y of
        True -> "yes"
        False -> "no"
    where y = xs == reverse xs


greetIfCool :: String -> IO ()
greetIfCool coolness =
    case cool of
        True -> putStrLn "eyyy. What's shakin'?"
        False -> putStrLn "pshhhh."
    where cool = coolness == "downright frosty yo"


--exercise
--1.functionC x y = if (x > y) then x else y

functionC x y =
    case x > y of
        True -> x
        False -> y


--2.ifEvenAdd2 n = if even n then (n+2) else n

ifEvenAdd2 n =
    case even n of
        True -> n + 2
        False -> n


--3. fill missing case
nums x =
    case compare x 0 of
        LT -> -1
        GT -> 1
        EQ -> 0