# hAssert

A simple testing library

- Assert values are equal
    `assertEquals :: (Show a, Eq a) => String -> a -> a -> IO ()`
- Assert value is true
    `assertTrue :: String -> Bool -> IO ()`

- Run IO in parallel and return once all are finished
    `testParallel :: [IO ()] -> IO ()`

include using `import Assert`
