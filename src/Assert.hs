module Assert where

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


