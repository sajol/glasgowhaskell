module DerivingInstances where

data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun


data Date = Date DayOfWeek Int


instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _ = False


instance Eq Date where
    (==) (Date weekDay dayOfMonth) (Date weekDay' dayOfMonth') = isWeekDayEqual && isDayOfMonthEqual
        where isWeekDayEqual = weekDay == weekDay'
              isDayOfMonthEqual = dayOfMonth == dayOfMonth'



f :: Int -> Bool
f 1 = True
f 2 = True
f 3 = True
f _ = False


data Identity a = Identity a

instance Eq a => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'



--Intermission: Exercises => Write the Eq instance for the data type provided
--1
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn i1) (TisAn i2) = i1 == i2


--2
data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two i1 i2) (Two i1' i2')
        = i1 == i1' && i2 == i2'


--3
data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt i1) (TisAnInt i2) = i1 == i2
    (==) (TisAString s1) (TisAString s2) = s1 == s2
    (==) _ _ = False


--4
data Pair a = Pair a a

instance Ord a => Eq (Pair a) where
    (==) (Pair a1 a2) (Pair a1' a2')
        = compare  a1 a1' == EQ
            && compare a2 a2' == EQ


--5
data Tuple a b = Tuple a b

instance (Ord a, Ord b) => Eq (Tuple a b) where
    (==) (Tuple a1 a2) (Tuple a1' a2')
        = compare  a1 a1' == EQ
            && compare a2 a2' == EQ



--6
data Which a = ThisOne a | ThatOne a
instance (Ord a) => Eq (Which a) where
    (==) (ThisOne a1) (ThisOne a2) = compare a1 a2 == EQ
    (==) (ThatOne a1) (ThatOne a2) = compare a1 a2 == EQ
    (==) _ _ = False



--7
data EitherOr a b = Hello a | GoodBye b

instance (Ord a, Ord b) => Eq (EitherOr a b) where
    (==) (Hello a1) (Hello a2) = compare a1 a2 == EQ
    (==) (GoodBye b1) (GoodBye b2) = compare b1 b2 == EQ
    (==) _ _ = False