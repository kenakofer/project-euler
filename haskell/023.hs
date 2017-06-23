#!/usr/bin/runhaskell
{-|
 
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

KENAN'S ADDITION
let's call these integers "funny"

It seems like the even funnies are in short supply, since the first odd abundant is 945 (3^3 * 5 * 7) Here are the first 10 odd abundants: [945,1575,2205,2835,3465,4095,4725,5355,5775,5985] Here are the first 10 abundants: [12,18,20,24,30,36,40,42,48,54]

|-}

import Data.List
import PEFunctions


isPerfect :: (Integral a) => a -> Bool
isPerfect n = n == (sum.init.divisors$n)

isAbundant :: (Integral a) => a -> Bool
isAbundant n = n < (sum.init.divisors$n)

isDeficient :: (Integral a) => a -> Bool
isDeficient n = n > (sum.init.divisors$n)


abundants = filter isAbundant [2..]

----Way too slow
--isFunny n = not . or $ [((n-i) `isElemIncreasing` abundants) | i <- checks ]
--    where checks = takeWhile (<=n`div`2) abundants

isFunny n = not . or $ [(isAbundant (n-i)) | i <- checks]
    where checks = takeWhile (<=n`div`2) abundants

funnies = filter isFunny [0..28123]

main = do
    putStrLn . unlines . map show $ funnies ++ [sum funnies]
