module Jammin where

import Data.List (maximumBy, sortBy, groupBy)

data Fruit = Peach
           | Plum
           | Apple
           | BlackBerry
           deriving (Eq, Show, Ord)

--data JamJars = Jam Fruit Int deriving (Show, Eq)

--1.Name your module at the top of the file : jammin

--2.Rewrite JamJars with record syntax.

data JamJars =
    Jam {
        fruit :: Fruit,
        noOfJars :: Int
    } deriving (Eq, Show, Ord)


--3.What is the cardinality of JamJars?
-- 4 * cardinality of Int


--4.Add Ord instances to your deriving clauses


--5.You can use the record field accessors in other functions as well.
--To demonstrate this, work up some sample data that has a count
--of the types and numbers of jars of jam in the rows in our pantry
--(you can define more data than this if you like):

row1 = Jam Peach 1
row2 = Jam Plum 4
row3 = Jam Apple 10
row4 = Jam BlackBerry 5
row5 = Jam Peach 1
row6 = Jam Plum 10
allJam = [row1, row2, row3, row4, row5, row6]

--Now over that list of data, we can map the field accessor for the
--Int value and see a list of the numbers for each row.
jars :: [JamJars] -> [Int]
jars = map noOfJars


--6.Write a function that will return the total number of jars of jam

totalNoOfJars :: [JamJars] -> Int
totalNoOfJars = sum . jars


--7.Write a function that will tell you which row has the most jars of jam in it.

mostRow :: [JamJars] -> JamJars
mostRow = maximumBy (\jam1 jam2 -> compare (noOfJars jam1) (noOfJars jam2))


--8.Under your module name, import the module called Data.List .
--It includes some standard functions called sortBy and groupBy
--that will allow us to organize our list of jams. Look at their type
--signatures because there are some important differences between them.


--9.sort the list allJams by the first field in each record.

compareJamKind :: JamJars -> JamJars -> Ordering
compareJamKind (Jam k1 _) (Jam k2 _) = compare k1 k2

sortJamsByFruit :: [JamJars] -> [JamJars]
sortJamsByFruit = sortBy compareJamKind


--10.Now take the sorting function and use groupBy to group the
--jams by the type of fruit they are made from. You’ll later want
--the ability to sum the sublists separately, so you’re looking for a
--result that is a list of lists (again, the actual data in your list will
--depend on how you defined it)

groupJam :: [JamJars] -> [[JamJars]]
groupJam = groupBy (\j1 j2 -> fruit j1 == fruit j2) . sortJamsByFruit