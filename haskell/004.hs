#!/usr/bin/runhaskell
{-|

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

-}

import Data.List
import PEFunctions

bigPalindrome1 = maximum . filter isPalindrome $ [x*y | x <- [100..999], y<-[x..999]]

main = do
    putStrLn . show $ bigPalindrome1
