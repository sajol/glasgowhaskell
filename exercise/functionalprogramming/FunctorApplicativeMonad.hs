
import Safe (readMay)
import Control.Applicative ((<$>), (<*>))


--source https://www.schoolofhaskell.com/school/advanced-haskell/functors-applicative-functors-and-monads

notSafe = do
    putStrLn "Enter your birth year : "
    year <- getLine
    putStrLn $ "In 2020, your age will be  : " ++ show(2020 - read year)


safe = do
    putStrLn "Enter your birth year : "
    year <- getLine
    case readMay year of
         Nothing -> putStrLn "You have provided an invalid year"
         Just year -> putStrLn $ "In 2020, your age will be  : " ++ show(2020 - year)



--decouple code

displayAge mayBeAge = do
    case mayBeAge of
        Nothing -> putStrLn "You have provided an invalid year"
        Just year -> putStrLn $ "In that year, your age will be  : " ++ show (year)


yearToAge year = 2020 - year


good = do
    putStrLn "Enter your birth year : "
    year <- getLine
    let mayBeAge = case readMay year of
                        Nothing -> Nothing
                        Just year -> Just (yearToAge year)
    displayAge mayBeAge



--apply functor to make it cleaner. let mayBeAge looks bad

better = do
    putStrLn "Enter your birth year : "
    year <- getLine
    let mayBeAge = fmap yearToAge (readMay year)
    displayAge mayBeAge



betterWithDoNotation = do
    putStrLn "Enter your birth year : "
    year <- getLine
    let mayBeAge = do
        year <- readMay year
        return (yearToAge year)
    displayAge mayBeAge



--make future date also an input from user to fix static future date
dynamicAgeCalculator = do
    putStrLn "Enter your birth year : "
    year <- getLine
    putStrLn "Enter a future year : "
    futureYear <- getLine

    let mayBeAge = case readMay year of
                        Nothing -> Nothing
                        Just year ->
                            case readMay futureYear of
                                Nothing -> Nothing
                                Just futureYear -> Just (futureYear - year)
    displayAge mayBeAge


yearDiff futureYear birthYear = futureYear - birthYear


dynamicAgeCalculatorWithDoNotation = do
    putStrLn "Enter your birth year : "
    birthYear <- getLine
    putStrLn "Enter a future year : "
    futureYear <- getLine
    let mayBeAge = do
        birthYear <- readMay birthYear
        futureYear <- readMay futureYear
        return $ yearDiff futureYear birthYear

    displayAge mayBeAge



-- using fmap to yearDiff (currying)
dynamicAgeCalculatorWithDoNotationFunctor = do
    putStrLn "Enter your birth year : "
    birthYear <- getLine
    putStrLn "Enter a future year : "
    futureYear <- getLine
    let mayBeAge = do
        yearToAge <- fmap yearDiff $ readMay futureYear
        birthYear <- readMay birthYear
        return $ yearToAge birthYear

    displayAge mayBeAge



--applicative functor
--to be able to apply function which is inside a functor to a value inside a functor
ageCalculatorWithApplicativeFunctor = do
    putStrLn "Enter your birth year : "
    birthYear <- getLine
    putStrLn "Enter a future year : "
    futureYear <- getLine
    let mayBeAge =
            fmap yearDiff (readMay futureYear)
            <*> readMay birthYear
    displayAge mayBeAge

ageCalculatorWithApplicativeFunctor1 = do
    putStrLn "Enter your birth year : "
    birthYear <- getLine
    putStrLn "Enter a future year : "
    futureYear <- getLine
    let mayBeAge = yearDiff
            <$> (readMay futureYear)
            <*> readMay birthYear
    displayAge mayBeAge


--monad : context sensitivity; make decision on which processing path to follow based on previous result.

conditionalAgeCalculator = do
    putStrLn "Enter your birth year : "
    birthYear <- getLine
    putStrLn "Enter a future year : "
    futureYear <- getLine
    let mayBeAge = do
        futureYear <- readMay futureYear
        birthYear <- readMay birthYear
        return $
            if futureYear < birthYear
                then yearDiff birthYear futureYear
                else yearDiff futureYear birthYear
    displayAge mayBeAge
