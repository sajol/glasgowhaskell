
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

--currying
--((multThree 1) 2) 9

compareWithHundread :: (Num a, Ord a) => a -> Ordering
compareWithHundread n = (compare 100) n


myPlus :: (Num a) => a -> a -> a
myPlus a b = a + b

applyTwice :: (a -> a) -> a -> a
applyTwice f x = (f . f) x

--applyTwice (myPlus 10) 10
--applyTwice (++ " Haa") "Hey!!"

zipWith' :: (a->b->c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys