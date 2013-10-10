{-# LANGUAGE OverloadedStrings #-}

module Distribution.DepList.PackageDeps
    ( readPackageDeps
    , getPackageDeps
    ) where

import Distribution.Package (PackageIdentifier)
import Distribution.Text (simpleParse)

import Distribution.DepList.PkgDesc

import Data.Maybe
import qualified Data.Text as T

getPackageDeps :: PkgDesc -> [PackageIdentifier]
getPackageDeps desc = mapMaybe (simpleParse . T.unpack) deps where
    removeHash t = case T.breakOnEnd "-" t of
        ("", _) -> t
        (t', _) -> T.init t'

    deps = map removeHash $ getPkgField desc "depends"

readPackageDeps :: PackageIdentifier -> IO [PackageIdentifier]
readPackageDeps = fmap getPackageDeps . readPkgDesc
