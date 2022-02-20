
module Puzzle.Words (
    wordList
  ) where

import Data.Char (isAlpha, toLower)
import Data.List (nub)
import System.IO (readFile)

import Data.Containers.ListUtils (nubOrd)

validWord :: String -> Bool
validWord = all isAlpha

normWord :: String -> String
normWord = map toLower

wordList :: IO [String]
wordList = nubOrd . map normWord . filter validWord . lines <$> readFile "/usr/share/dict/words"
