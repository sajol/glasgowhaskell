module NormalForm where

{-
data Fiction = Fiction deriving Show

data Nonfiction = Nonfiction deriving Show

data BookType = FictionBook Fiction
              | NonFictionBook Nonfiction
              deriving Show
-}


type AuthorName = String

--not sum of products. so it is not in normal form
--data Author' = Author' (AuthorName, BookType)

--normal form
data Author = Fiction AuthorName
            | Nonfiction AuthorName
            deriving (Eq, Show)





--exercise
--1.Given type

--data FlowerType = Gardenia | Daisy | Rose | Lilac deriving Show

--type Gardener = String

--data Garden = Garden Gardener FlowerType

--What is the normal form of Garden?

type Gardener = String

data Garden = Gardenia Gardener
            | Daisy Gardener
            | Rose Gardener
            | Lilac Gardener
            deriving Show
