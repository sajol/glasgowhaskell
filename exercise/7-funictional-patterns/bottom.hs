
{-
Bottom is a non-value used to denote that the program cannot
return a value or result. The most elemental manifestation of
this is a program that loops infinitely. Other forms can involve
things like writing a function that doesn’t handle all of its inputs
and fails on a pattern match
-}

f x = f x

dontDoThis :: Bool -> Int
dontDoThis True = 1

--morally equivalent to
definitelyDontDoThis :: Bool -> Int
definitelyDontDoThis True = 1
definitelyDontDoThis False = error "oops"