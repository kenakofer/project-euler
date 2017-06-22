#!/usr/bin/runhaskell
{-|
You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
-}

import Data.List
import PEFunctions

--         Yr  Mo  Da
data Day = Day
    { year  :: Int
    , month :: Int -- 0-11
    , dom   :: Int -- 0-30 on a 31-day month
    , dow   :: Int -- 0-6, let sunday be 0
    }
    deriving (Show)

isLeapYear :: Int -> Bool
isLeapYear y
    | 400 `divides` y = True
    | 100 `divides` y = False
    | 4   `divides` y = True
    | otherwise       = False

months isLeap = [
    31,--Jan
    if isLeap then 29 else 28,--Feb
    31,--Mar
    30,--Apr
    31,--May
    30,--Jun
    31,--Jul
    31,--Aug
    30,--Sep
    31,--Oct
    30,--Nov
    31--Dec
    ]

nextDay :: Day -> Day
nextDay day = day {year=y, month=m, dom=dm, dow=dw}
    where monthCount = (months . isLeapYear . year $ day) !! (month day)
          incrementMonth = dom day == monthCount - 1
          incrementYear  = incrementMonth && month day == 11
          dw = (dow   day + 1) `mod` 7
          dm = (dom   day + 1) `mod` monthCount
          m  = (month day + (if incrementMonth then 1 else 0)) `mod` 12
          y  = (year  day + (if incrementYear  then 1 else 0))

-- It's devious that the day they give you is NOT the day you start on...
initialDay = Day {year=1900, month=0, dom=0, dow=1}

allDays :: Day -> [Day]
allDays start = start : (allDays.nextDay$start)


main = do
    putStrLn . show . length . filter (\d -> dom d == 0 && dow d == 0) . takeWhile (\d -> year d < 2001) . dropWhile (\d -> year d < 1901) . allDays $ initialDay 
