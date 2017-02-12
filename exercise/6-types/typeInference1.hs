module TypeInference1 where

f :: Num a => a -> a -> a
f x y = x + y + 3

triple :: Integer -> Integer
triple x = x * 3

--declaring types locally
triple' :: Integer -> Integer
triple' x = tripleItYo x
    where tripleItYo :: Integer -> Integer
          tripleItYo y = y * 3