module Assert (assertTrue, assertEquals, testParallel) where

import GHC.Conc

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

testParallel :: [IO ()] -> IO ()
testParallel tests = do
    threads <- sequence $ map forkIO tests
    threadJoin threads

threadJoin :: [ThreadId] -> IO ()
threadJoin threads =
    threadJoin' (length threads) threads

threadJoin' :: Int -> [ThreadId] -> IO ()
threadJoin' testCount [] = putStrLn "All tests complete"
threadJoin' testCount (x:xs) = do
    status <- threadStatus x
    case status of
        ThreadFinished -> do
            putStrLn $ (show (testCount - length xs)) ++ " of " ++ (show testCount) ++ " tests completed"
            threadJoin' testCount xs
        ThreadDied -> fail "test thread failed"
        otherwise -> do
            threadJoin (x:xs)
