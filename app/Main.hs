module Main where

import Assert
import Lib
import Control.Parallel
import Control.Concurrent

main :: IO ()
main =
    testParallel [
        assertEquals "Equality test" 10 (10 + 10),
        assertTrue "True test" (10 == (5 + 5)),
        assertTrue "Failing test" False,
        assertTrue "Failing test" False,
        assertTrue "Failing test" False,
        assertTrue "Failing test" False,
        assertTrue "Failing test" False,
        assertTrue "Failing test" False,
        assertTrue "Failing test" False,
        assertTrue "Failing iiiiitest" (10 == (takeAWhile 10000)),
        assertTrue "Failing test" False,
        assertTrue "Failing test" False,
        assertTrue "Failing test" False]

takeAWhile 0 = 100
takeAWhile a = a + takeAWhile (a - 1)
