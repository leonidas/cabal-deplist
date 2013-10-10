# Cabal Dependency Tool

Simple tool for listing all dependencies (direct dependencies and recursive dependencies of dependencies) from a cabal project along with their licenses in CSV format.

This current early version is not configurable in any way and only fulfills a very specific use-case.


## Example use

    cabal-deplist-lib$ cabal-deplist
    "Cabal-1.18.1","BSD3"
    "array-0.4.0.1","BSD3"
    "attoparsec-0.10.4.0","BSD3"
    "attoparsec-conduit-1.0.1.2","MIT"
    "base-4.6.0.1","BSD3"
    "bytestring-0.10.0.2","BSD3"
    "conduit-1.0.7.4","MIT"
    "containers-0.5.0.0","BSD3"
    "deepseq-1.3.0.1","BSD3"
    "directory-1.2.0.1","BSD3"
    "filepath-1.3.0.1","BSD3"
    "ghc-prim-0.3.0.0","BSD3"
    "integer-gmp-0.5.0.0","BSD3"
    "lifted-base-0.2.1.0","BSD3"
    "base-unicode-symbols-0.2.2.4","BSD3"
    "mmorph-1.0.0","BSD3"
    "monad-control-0.3.2.1","BSD3"
    "mtl-2.1.2","BSD3"
    "pretty-1.1.1.0","BSD3"
    "process-1.1.0.2","BSD3"
    "process-conduit-1.0.0.1","BSD3"
    "control-monad-loop-0.1","BSD3"
    "resourcet-0.4.8","BSD3"
    "shakespeare-text-1.0.0.7","MIT"
    "shakespeare-1.2.0","MIT"
    "parsec-3.1.3","BSD3"
    "system-fileio-0.3.11","MIT"
    "system-filepath-0.4.7","MIT"
    "template-haskell-2.8.0.0","BSD3"
    "text-0.11.3.1","BSD3"
    "time-1.4.0.1","BSD3"
    "transformers-0.3.0.0","BSD3"
    "transformers-base-0.4.1","BSD3"
    "unix-2.6.0.1","BSD3"
    "void-0.6.1","BSD3"
    "hashable-1.1.2.5","BSD3"
    "semigroups-0.11","BSD3"
    "nats-0.1.2","BSD3"
    "unordered-containers-0.2.3.3","BSD3"
