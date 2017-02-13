module HigherOrderFunction where

data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)


reportBoss :: Employee -> Employee -> IO ()
reportBoss e1 e2 =
    putStrLn $ show e1 ++ " is the boss of " ++ show e2


employeeRank' :: Employee -> Employee -> IO ()
employeeRank' e1 e2 =
    case compare e1 e2 of
        GT -> reportBoss e1 e2
        LT -> flip reportBoss e1 e2 -- higher order function application
        EQ -> putStrLn $ "Neither employee is the boss"

--refactor employeeRank' to be more flexible
employeeRank :: (Employee -> Employee -> Ordering)
                -> Employee
                -> Employee
                -> IO ()
employeeRank f e1 e2 =
    case f e1 e2 of
        GT -> reportBoss e1 e2
        EQ -> putStrLn $ "Neither employee is the boss"
        LT -> flip reportBoss e1 e2


codersRuleCEOsDrool :: Employee -> Employee -> Ordering
codersRuleCEOsDrool Coder Coder = EQ
codersRuleCEOsDrool Coder _ = GT
codersRuleCEOsDrool _ Coder = LT
codersRuleCEOsDrool e1 e2 = compare e1 e2

--employeeRank compare Coder CEO
--employeeRank codersRuleCEOsDrool Coder CEO

--intermission exercise type signature
--1.
dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10


--2
oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

--3
oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2