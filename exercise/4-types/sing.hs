--fix broken : exercise
module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if (x > y) then sndString x else fstString y
    where x = "Singing"
          y = "Somewhere"