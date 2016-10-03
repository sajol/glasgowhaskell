
{-length using (conditional function) function definition for base case and induction case-}
length_cond [] = 0
length_cond (x : xs) = 1 + length_cond xs

{-length using if then else expression-}
length_ifthenelse lst =
    if lst == [] then 0
    else let x:xs = lst in 1 + length_ifthenelse xs

{-length using guards-}
length_guard lst
    | lst == [] = 0
    | otherwise = 1 + length_guard xs
    where x:xs = lst


lst = [1 .. 10]

main =
    do
        print (length_cond lst)
        print (length_ifthenelse lst)
        print (length_guard lst)