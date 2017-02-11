module MoreOperations where
import Data.List
-- + operation comes from Num typeclass. add Num to the context
add :: Num a => a -> a -> a
add x y = x + y

-- for > we have to add Ord constraint
addWeird :: (Ord a, Num a) => a -> a -> a
addWeird x y =
    if x > 1
    then x + y
    else x

-- Ord implies Eq
check' :: (Ord a) => a -> a -> Bool
check' a a' = a == a'

check'' :: (Eq a) => a -> a -> Bool
check'' a a' = a == a'


-- concrete types imply all the typeclasses they provide

-- Int type has the typeclasses Num, Eq, Ord implemented
add' :: Int -> Int -> Int
add' x y = x + y


addWeird' :: Int -> Int -> Int
addWeird' x y =
    if x > 1
    then x + y
    else x


check''' :: Int -> Int -> Bool
check''' x y = x == y



--fix tyepcheck error
--1
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)



--2
data Mood = Blah | Woot deriving (Eq, Ord, Show)

settleDown x = if x == Woot
                    then Blah
                    else x


--3
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "droll"
s2 = Sentence "Julie" "loves" "dogs"


--4
data Rocks = Rocks String deriving (Eq, Ord, Show)

data Yeah = Yeah Bool deriving (Eq, Ord, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Ord, Show)

--phew = Papu "chases" True

truth = Papu (Rocks "chomskydoz") (Yeah True)


equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

--comparePapus :: Papu -> Papu -> Bool
--comaprePapus p p' = p > p'
-- fix : derive Ord

comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'


--match the types

mySort :: Ord a => [a] -> [a]
mySort = sort
signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)

