#!/usr/bin/runhaskell
{-|

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

-}

import Data.List
import PEFunctions

main = do
    putStrLn . show . maximum . primeFactors $ 600851475143
