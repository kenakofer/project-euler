#!/usr/bin/runhaskell
{-|

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

-}

import Data.List
import PEFunctions

getTriple :: [Integer]
getTriple = head . filter (\(a:b:c:xs) -> a*a+b*b==c*c) $ [[a,b,1000-a-b] | a <- [1..998], b <- [a..999-a]]

main = do
    putStrLn . show . product $ getTriple
