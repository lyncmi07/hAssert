module Assert where

assertEquals :: Eq b => String -> a -> b -> (a -> b) -> IO Bool
assertEquals description input expectedOutput fn = do
    putStrLn ("Assertion test: " ++ description)
    return (expectedOutput == (fn input))

assertTrue :: String -> a -> (a -> IO b) -> IO b
assertTrue description input fn = do
    putStrLn ("Assertion test: " ++ description)
    fn input
