module List where

data List a = Nil | Cons a (List a) deriving Show

nil = Nil

nil' = []

oneItem = Cons "woohoo!" Nil

oneItem' = ["woohoo"]