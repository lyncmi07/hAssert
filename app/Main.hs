module Main where

import Assert
import Control.Parallel
import Control.Concurrent

main :: IO ()
main = do
    putStrLn "hello world"

    runTests [
            (Test "test1" (assertTrue "This will be true" True)),
            (Test "test2" (assertTrue "This will be false" False)),
            (Test "test3" (assertTrue "This will also be true" True)),
            (Test "test4" (assertEquals "numbers" 1 2))
        ]

takeAWhile 0 = 100
takeAWhile a = a + takeAWhile (a - 1)
