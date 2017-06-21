#!/usr/bin/runhaskell
{-|

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

takes 395 seconds
-}

import Data.List
import PEFunctions

collatzList = map collatzLength [0..999999]

collatzLength :: Integer -> Integer
collatzLength = f
    where 
        f 1 = 1
        f n 
            | even n = 1 + collatzLength (n`div`2) 
            | odd n = 1 +collatzLength (3*n+1)

bestCollatzTwo :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
bestCollatzTwo (x1, c1) (x2, c2)
    | c1>c2 = (x1,c1)
    | True  = (x2,c2)

-- Too many redundant operations here 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1, but for 10 and 16 will compute much the same. Maybe use maps?
bestCollatzAll :: (Integer, Integer)
bestCollatzAll = foldl' bestCollatzTwo (0,0) [(x,collatzLength x) | x <- [1..999999]]

main = do
    putStrLn . show $ bestCollatzAll
