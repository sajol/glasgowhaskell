
import Data.Char

asInt :: String -> Int
asInt xs = foldl (\accumulator elem -> (accumulator * 10 + digitToInt elem)) 0 xs