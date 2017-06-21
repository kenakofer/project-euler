#!/usr/bin/runhaskell
{-|
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
-}

import Data.List
import PEFunctions

sumpower :: Integer -> Integer -> Integer
sumpower x y = sum . digits $ x^y

main = do
    putStrLn . show . sumpower 2 $ 1000
