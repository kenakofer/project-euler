#!/bin/runhaskell
{-|

sum of divisibles of 3 and 5 below 1000

-}

import Data.List
import PEFunctions

threeFive = sum . union [3,6..999] $ [5,10..999]

main = do
    putStrLn . show $ threeFive
