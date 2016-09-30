
import System.Random

check :: Int -> Int -> IO ()
check number guess =
        if number == guess
            then putStrLn "Your guess is right!"
            else
                do
                    if number > guess then putStrLn "Guess a higher number!" else putStrLn "Guess a lower number!"
                    makeguess number

makeguess :: Int -> IO ()
makeguess number =
    do
        q <- getLine
        let guess = read q :: Int
        check number guess


guess :: IO ()
guess =
    do
        putStrLn "Guess a number between 1 and 100 :"
        randomNumber <- randomRIO (1, 100) :: IO Int
        makeguess randomNumber