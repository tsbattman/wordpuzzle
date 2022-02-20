
module Puzzle.SpellingBee (
    spellingBee
  , beeMatch
  , SpellingBee(..)
  ) where

import Data.Char (toLower)
import Data.List ((\\), delete, elem, nub, null)

data SpellingBee = SpellingBee Char [Char]

beeMatch :: SpellingBee -> String -> Bool
beeMatch (SpellingBee req others) word = req `elem` word
  && null (nub (req `delete` word) \\ others)

spellingBee :: String -> [String] -> [String]
spellingBee (g:rid) = filter (beeMatch bee) . filter (\w -> length w > 3)
  where bee = SpellingBee (toLower g) (map toLower rid)
