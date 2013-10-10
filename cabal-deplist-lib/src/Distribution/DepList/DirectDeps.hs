
module Distribution.DepList.DirectDeps
    ( readDirectDeps
    , PackageIdentifier
    ) where

import Distribution.Simple.LocalBuildInfo (externalPackageDeps)
import Distribution.Simple.Configure (getPersistBuildConfig)
import Distribution.Package (PackageIdentifier)

readDirectDeps :: IO [PackageIdentifier]
readDirectDeps = do
    bi <- getPersistBuildConfig "dist"
    return $ map snd $ externalPackageDeps bi
