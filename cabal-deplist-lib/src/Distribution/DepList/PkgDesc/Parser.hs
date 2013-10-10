{-# LANGUAGE OverloadedStrings #-}

module Distribution.DepList.PkgDesc.Parser
    ( PkgDesc
    , pkgDescParser
    ) where

import Control.Applicative

import Data.Attoparsec.Text
import Data.Char
import Data.Text (Text)
import Data.Map (Map)

import qualified Data.Map as Map

type PkgDesc = Map Text [Text]


pkgDescParser :: Parser PkgDesc
pkgDescParser = Map.fromList <$> sections where
    sections      = many1 section
    section       = (,) <$> sectionTitle <*> sectionLines
    sectionTitle  = takeWhile1 isTitleChar <* ":"
    isTitleChar c = isAlpha c || c == '-'
    sectionLines  = many1 sectionLine
    sectionLine   = many1 space *> takeTill isEndOfLine <* endOfLine
