# hAssert

A simple testing library

- Assert values are equal
    `assertEquals :: (Show a, Eq a) => String -> (expected::a) -> (actual::a) -> IO ()`
- Assert value is true
    `assertTrue :: String -> Bool -> IO ()`

- Create IO Monad test
    `Test (description::String) (testLogic::IO())`

- Run multiple tests, writing out failures as they are round
    `runTests :: [Test] -> IO ()`

include using `import Assert`
