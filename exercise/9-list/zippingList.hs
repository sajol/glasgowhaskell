module ZippingList where

zipTest1 = zip [1, 2, 3] [3, 4, 5]

zipTest2 = zip ['a' .. 'd'] ['A' .. 'D']

zipTest3 = zip ['a' .. 'c'] ['A' .. 'D']

zipTest4 = zip [] ['A' .. 'D']


unzipTest1 = unzip $ zipTest1

unzipTest2 = unzip $ zipTest3


zipWithTest1 = zipWith (+) [1..10] [11..20]

zipWithTest2 = zipWith (*) [1..10] [11..20]



--zip exercises
--1.Write your own version of zip :: [a] -> [b]
--and ensure it behaves the same as the original.

myZip :: [a] -> [b] -> [(a,b)]
myZip [] [] = []
myZip [] _ =  []
myZip _ [] =  []
myZip (x:xs) (y:ys) = (x,y) : myZip xs ys


myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] [] = []
myZipWith _ [] _ =  []
myZipWith _ _ [] =  []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys




