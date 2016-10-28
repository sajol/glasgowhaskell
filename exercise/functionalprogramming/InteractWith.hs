
import System.Environment

interactWith f inputFile outputFile =
    do
        input <- readFile inputFile
        writeFile outputFile (f input)

myFunction = \x -> x

main =
    do
        args <- getArgs
        case args of
           [input, output] -> interactWith myFunction input output
