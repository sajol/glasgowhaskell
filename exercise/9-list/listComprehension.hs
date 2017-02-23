module ListComprehension where

--list comprehension to remove all the lowercase letters from a showString

removeLowerCase :: String -> String
removeLowerCase s = [x | x <- s , elem x ['A' .. 'Z']]

generateAcronym :: String -> String
generateAcronym s = removeLowerCase s

findVowel :: String -> String
findVowel s = [x | x <- s, elem x "aeiou"]


--intermission:exercise
mySqr = [x^2 | x <- [1..5]]
myCube = [x^3 | x <- [1..5]]

--1.write an expression that will make tuples of the outputs of mySqr and myCube.
tupleOfsqrAndCube = [(x,y) | x <- mySqr, y <- myCube]


--2.Now alter that function so that it only uses the x and y values that are less than 50
tupleOfsqrAndCube' = [(x,y) | x <- mySqr, y <- myCube , x < 50, y < 50]

--3.Now apply another function to that list comprehension to deter- mine how many tuples inhabit your output list.
numberOfTuples = length tupleOfsqrAndCube'