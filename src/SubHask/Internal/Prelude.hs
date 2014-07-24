module SubHask.Internal.Prelude
    (
    Eq (..)
    , Ord (..)
    , Read (..)
    , Show (..)

    , String
    , Char

    , Int
    , Integer
    , fromIntegral
    , mod
    , div

    , Float
    , Double
    , Rational

    , Bool (..)

    , undefined
    , error

--     , module Data.Foldable
    , module Data.List
    , module Data.Maybe
    , module Data.Proxy
    )
    where

import Data.Foldable
import Data.List
import Data.Maybe
import Data.Proxy
import Data.Traversable
