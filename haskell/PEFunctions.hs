module PEFunctions where

import Data.List
import Data.Foldable (maximumBy, Foldable)
import Data.Ord      (comparing)

fibs :: [Integer]
fibs = 0 : 1 : next fibs
  where next (a : t@(b:_)) = (a+b) : next t

primes :: [Integer]
primes = 2 : [i | i <- [3..], and [rem i p > 0 | p <- takeWhile (\p -> p^2 <= i) primes]]

isPrime x = x `isElemIncreasing` primes

primeFactors :: Integer -> [Integer]
primeFactors n = primeFactorsIterate 2 n

primeFactorsIterate :: Integer -> Integer -> [Integer]
primeFactorsIterate h n
    | n<2 = []
    | True= factor : primeFactorsIterate factor (n`div`factor)
        where factor = head . filter (`divides`n) $ eligibleChecks
              eligibleChecks = (dropWhile (<h) . takeWhile (\a->a*a<=n) $ primes) ++ [n]

--Unlike union, respects repeated elements in both lists. Does NOT preserve order
unionRepeats :: (Eq a) => [a] -> [a] -> [a]
unionRepeats xs ys = ys ++ (xs \\ ys)

divides :: (Integral a) => a -> a -> Bool
x`divides`y=y`mod`x==0

isPalindrome :: (Show a) => a -> Bool
isPalindrome x = reverse sx == sx
    where sx = show x

powerset :: [a] -> [[a]]
powerset [] = [[]]
powerset (x:xs) = powerset xs ++ map (x:) (powerset xs)

--divisors :: Integer -> [Integer]
--divisors 0 = []
--divisors n = orderedNub . sort . map product . powerset . primeFactors $ n

divisors :: (Integral a) => a -> [a]
divisors 0 = []
divisors n = f ++ sl
    where s  = ceiling.sqrt.fromIntegral$n
          f  = filter (\f -> f `divides` n) $ [1..s-1]
          l  = [n`div`i | i <- reverse f]  
          sl = if s*s==n then s:l else l

orderedNub :: (Ord a) => [a] -> [a]
orderedNub [] = []
orderedNub [x] = [x]
orderedNub (x:xs)
    | x<y = x:orderedNub xs
    | True= orderedNub xs
  where y = head xs

digits_rev :: (Integral a) => a -> [a]
digits_rev 0 = []
digits_rev x = x `mod` 10 : digits_rev (x `div` 10)
digits = reverse . digits_rev

numFromDigits :: (Integral a) => [a] -> a
numFromDigits = helper . reverse
    where helper [] = 0
          helper (x:xs) = x + 10*(helper xs)

lexicographicPermutations :: [a] -> [[a]]
lexicographicPermutations [] = [[]]
lexicographicPermutations (x:[]) = [[x]]
lexicographicPermutations xs = [ (fst$pop i xs):p | i <- [0..length xs-1], p <- lexicographicPermutations (snd$pop i xs)] 
    where pop i xs = let (as,bs) = splitAt i xs in (xs !! i, as ++ tail bs)

combinations [] _ = []
combinations _  0 = [[]]
combinations xs n = [x:c | x <- xs, c <- combinations xs (n-1)]

insertAt :: a -> Int -> [a] -> [a]
insertAt x i xs = as ++ (x:bs) 
    where (as, bs) = splitAt i xs

maxBy :: (Foldable t, Ord a) => (b -> a) -> t b -> b
maxBy = maximumBy . comparing

isElemIncreasing :: (Ord a) => a -> [a] -> Bool
isElemIncreasing x xs
    | x < head xs  = False
    | x == head xs = True
    | otherwise    =  isElemIncreasing x $ tail xs

factorial x
    | x < 2 = 1
    | otherwise = x * factorial (x-1)
