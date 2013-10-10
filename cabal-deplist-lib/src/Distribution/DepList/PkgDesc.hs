
module Distribution.DepList.PkgDesc
    ( readPkgDesc
    , getPkgField
    , PkgDesc
    ) where

import Data.Conduit
import Data.Conduit.Text (decode, utf8)
import Data.Conduit.Process
import Data.Conduit.Attoparsec
import Data.Text (Text)
import Distribution.Text (display)
import Distribution.Package (PackageIdentifier)

import Distribution.DepList.PkgDesc.Parser

import qualified Data.Map as Map

getPkgField :: PkgDesc -> Text -> [Text]
getPkgField pkgDesc key = Map.findWithDefault [] key pkgDesc

readPkgDesc :: PackageIdentifier -> IO PkgDesc
readPkgDesc pkgId =

    runResourceT
        $ sourceCmd cmd
        $= decode utf8
        $$ sinkParser pkgDescParser

    where cmd = "ghc-pkg describe \"" ++ display pkgId ++ "\""

