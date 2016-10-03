
pred_even x = even x
pred_odd x = odd x

lst = [1 .. 10]

filter_even lst = filter pred_even lst
filter_odd lst = filter pred_odd lst


{-custom filter-}
custom_filter pred lst
    | null lst = []
    | pred x = x : custom_filter pred xs
    | otherwise = custom_filter pred xs
    where x:xs = lst


main =
    do
        print (filter_even lst)
        print (filter_odd lst)
        print (filter (< 5) lst)
        print (filter (\ x -> x > 5) lst)
        print (filter (\ x -> x `elem` [5 .. 10]) lst)
        print (custom_filter (\ x -> x `elem` [5 .. 10]) lst)