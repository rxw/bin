#!/usr/bin/ghci
multiplier a b = a * b

isPrime n = if n `mod` 2 == 0
            then False
            else True
