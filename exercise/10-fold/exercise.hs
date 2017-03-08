module Exercise where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [   DbDate (UTCTime
                    (fromGregorian 1911 5 1)
                    (secondsToDiffTime 34123))
      , DbNumber 9001
      , DbNumber 9002
      , DbString "Hello, world!"
      , DbDate (UTCTime
                   (fromGregorian 1921 5 1)
                   (secondsToDiffTime 34123))
    ]



--1.Write a function that filters for DbDate values and returns a list
--of the UTCTime values inside them

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate dbItems = foldr f [] dbItems
    where f (DbDate a) acc = a : acc
          f _          acc = acc


--2.Write a function that filters for DbNumber values and returns a
--list of the Integer values inside them.

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber dbItems = foldr f [] dbItems
    where f (DbNumber a) acc = a : acc
          f _            acc = acc


--3.Write a function that gets the most recent date.

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent dbItems = foldr f acc dbItems
    where
        acc = UTCTime (fromGregorian 0 1 1) (secondsToDiffTime 0)
        f (DbDate a) acc
            | a > acc = a
            | otherwise = acc

        f _ acc = acc


--4.Write a function that sums all of the DbNumber values.

sumDb :: [DatabaseItem] -> Integer
sumDb dbItems = foldr f 0 dbItems
    where
        f (DbNumber a) acc = a + acc
        f _            acc = acc


--5.Write a function that gets the average of the DbNumber values.

avgDb :: [DatabaseItem] -> Double
avgDb dbItems = f (filterDbNumber dbItems)
    where
        f [] = 0
        f dbNums = fromIntegral (sum dbNums) / fromIntegral (length dbNums)
