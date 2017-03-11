module WarmUpExercise where

stops = "pbtdkg"
vowels = "aeiou"


--1.write a function that takes input from stops and vowels
-- and make 3-tuples of all possible stop-vowel-stop combinations

svTuples :: [(Char, Char, Char)]
svTuples = [(s,v,s') | s <- stops, v <- vowels, s' <- stops]


--1.2.write a function that returns the tuples starting with p
svTuplesStartingWithP = [(s,v,s') | s <- stops, v <- vowels, s' <- stops, s == 'p']


--2.average size of words in a sentence

seekritFunc x =
    div (sum (map length $ words x))
        (length $ words x)


--3.rewrite the function using fractional division?
seekritFunc' x =
    fromIntegral (sum (map length $ words x)) / fromIntegral (length $ words x)

