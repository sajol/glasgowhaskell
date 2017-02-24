module FilterListOfValues where


evenNumbers :: [Integer] -> [Integer]
evenNumbers xs = filter even xs

oddNumbers :: [Integer] -> [Integer]
oddNumbers xs = filter odd xs


--intermission:exercise
--1.write a filter function that would
--give us all the multiples of 3 out of a list from 1-30

multiplesOf3 = filter (\x -> rem x 3 == 0) [1..30]


--2.compose the above function with the length function
--to tell us *how many* multiples of 3 there are between 1 and 30?
numOfMultiplesOf3 = (length . filter (\x -> rem x 3 == 0)) [1..30]


--3.remove all articles (’the’, ’a’, and’an’) from sentences
removeArticles :: String -> [String]
removeArticles s =
    (filter (\x -> notElem x ["a", "an", "the"]) . seperateBySpace) s



seperateBySpace :: String -> [String]
seperateBySpace s =
    case takeWhile (/= ' ') dropWhiteSpace of
        [] -> []
        xs -> xs : seperateBySpace rest
        where
            dropWhiteSpace = dropWhile (== ' ') s
            rest = dropWhile (/= ' ') dropWhiteSpace