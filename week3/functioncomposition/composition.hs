{-theorem :  map f (map g xs) = map (f.g) xs -}

comp_test lst = map ((*2) . (+2)) lst

sum_foldl xs = foldl (\acc elt -> acc + elt) 0 xs

prod_foldl xs = foldl (\acc elt -> acc * elt) 1 xs

{- point free style -}
sum_foldl_point_free = foldl (+) 0

prod_foldl_point_free = foldl (*) 1


reverse_foldl xs = foldl (\acc elt -> elt : acc) [] xs

max_foldr xs = foldr max 0 xs


lst = [1 .. 10]


main =
    do
        print (comp_test lst)
        print ((sum_foldl lst) == (sum_foldl_point_free lst))
        print ((prod_foldl lst) == (prod_foldl_point_free lst))
        print (max_foldr lst)
        print (reverse_foldl lst)
