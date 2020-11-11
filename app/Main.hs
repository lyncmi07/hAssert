module Main where

import Assert
import Lib
import Control.Parallel
import Control.Concurrent

main :: IO ()
main = do
    _ <- forkIO $ assertEquals "Equality test" 10 (10 + 10)
    _ <- forkIO $ assertTrue "True test" (10 == (5 + 5))
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing iiiiitest" (10 == (takeAWhile 10000))
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    _ <- forkIO $ assertTrue "Failing test" False
    return ()

takeAWhile 0 = 100
takeAWhile a = a + takeAWhile (a - 1)
