module List where

data List a = Nil | Cons a (List a) deriving Show

nil = Nil

nil' = []

oneItem = Cons "woohoo!" Nil

oneItem' = "woohoo" : []

twoItems = Cons "woohoo" (Cons "woohooo" Nil)

twoItems' = "woohoo" : "woohooo" : []