#!/usr/bin/runhaskell
{-|

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

-}

import Data.List
import PEFunctions

--Works by finding the gcd of the product 20!
reallyDivisible1 = product . foldl unionRepeats [] . map primeFactors $ [2..20]

main = do
    putStrLn . show $ reallyDivisible1
