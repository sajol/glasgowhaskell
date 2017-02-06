module Curry where

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

--The ability to apply some of a function's arguments is described as partial application
addTen = addStuff 5

fifteen = addTen 5

tweenty = addTen 10

--progression
--Integer -> Integer -> Integer
--is actually
--Integer -> (Integer -> Integer)

--so applying each argument
--produces the following progression
--  Integer -> Integer -> Integer
--             Integer -> Integer
--                        Integer

--uncurried function => one function many arguments
--curried function => many functions one argument apiece

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

typicalCurriedFunction :: Integer -> Bool -> Integer
typicalCurriedFunction i b = i + (nonsense b)

uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i,b) = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i +  (nonsense b)

anonymousAndManuallyNested :: Integer -> Bool -> Integer
anonymousAndManuallyNested = \i -> \b -> i +  (nonsense b)




























