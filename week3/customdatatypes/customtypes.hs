
data SimpleNum = One | Two | Many deriving Show

data CricketScore = Score [Char] Int Int deriving Show

convert n
    | (n==1) = One
    | (n==2) = Two
    | otherwise = Many


convert_lst = map convert


lst = [1 .. 10]


main =
    do
        print (convert 1)
        print (convert 2)
        print (convert 300)
        print (convert_lst lst)
        print (Score "New Zea Land" 350 4 )

