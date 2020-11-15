module Assert (assertTrue, assertEquals, runTests, Test (..)) where

import Control.Monad
import Control.Exception
import System.IO.Error

-- Test description logic
data Test = Test String (IO ())

assertEquals :: (Show a, Eq a) => String -> a -> a -> IO ()
assertEquals description expected actual = do
    if (expected == actual)
        then return ()
        else fail ((show expected) ++ " != " ++ (show actual) ++ ": " ++ description ++ " failed")

assertTrue :: String -> Bool -> IO ()
assertTrue description value = 
    if value
        then return ()
        else fail (description ++ " is not true")

runTests :: [Test] -> IO ()
runTests [] = putStrLn "All tests passed"
runTests (t:ts) = do
        othersDidNotFail <- runTest t (\e -> do
                    describeFailure t e
                    runTestsAsFailed ts)
        if othersDidNotFail
            then runTests ts
            else fail "There were test failures"

runTestsAsFailed :: [Test] -> IO Bool
runTestsAsFailed [] = return False
runTestsAsFailed (t:ts) = do
    runTest t (\e -> do describeFailure t e; return True)
    runTestsAsFailed ts

runTest :: Test -> (IOError -> IO Bool) -> IO Bool
runTest (Test _ testLogic) errorHandler = catch (do testLogic; return True) errorHandler

describeFailure :: Test -> IOError -> IO ()
describeFailure (Test description _) testFailure = putStrLn $ "Test " ++ description ++ " failed with " ++ (show $ ioeGetErrorType testFailure) ++ ":" ++ (show $ ioeGetErrorString testFailure)

