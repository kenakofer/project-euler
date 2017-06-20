#!/usr/bin/runhaskell
{-|

sum of primes below 2 million

-}

import Data.List
import PEFunctions

--TODO takes too long, like 5 minutes
main = do
    putStrLn . show . sum . takeWhile (<2000000) $ primes
