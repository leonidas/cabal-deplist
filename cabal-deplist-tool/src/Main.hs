{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Conduit.List as CL

import Distribution.Text (display)

import Data.Conduit
import Data.Maybe
import Data.CSV.Conduit

import System.IO (stdout)

import Distribution.DepList.PkgDesc
import Distribution.DepList.DirectDeps
import Distribution.DepList.RecursiveDeps

import qualified Data.Text as T
import qualified Data.Conduit.List as CL
import qualified Data.Conduit.Binary as CB


main :: IO ()
main = do
    direct <- readDirectDeps
    let query desc = license where
            license = case getPkgField desc "license" of
                [] -> ""
                [l] -> l
        toRow (pkgId, license) = [display pkgId, T.unpack license]
    findRecursiveDeps query direct
        $= CL.map toRow
        $= fromCSV defCSVSettings
        $$ CB.sinkHandle stdout
