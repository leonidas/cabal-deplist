
module Distribution.DepList.RecursiveDeps where

import Control.Monad.IO.Class
import Distribution.Package (PackageIdentifier)

import Distribution.DepList.PkgDesc
import Distribution.DepList.PackageDeps

import Data.Conduit (Source, yield)

import qualified Data.Set as Set

findRecursiveDeps :: MonadIO m => (PkgDesc -> a) -> [PackageIdentifier] -> Source m (PackageIdentifier, a)
findRecursiveDeps query = go Set.empty . Set.fromList where
    go processed queue
        | Just (pkgId, queue') <- Set.minView queue = if pkgId `Set.member` processed
            then go processed queue'
            else do
                desc <- liftIO $ readPkgDesc pkgId
                yield (pkgId, query desc)
                let deps = getPackageDeps desc
                go (Set.insert pkgId processed) (Set.fromList deps `Set.union` queue')
        | otherwise = return ()

