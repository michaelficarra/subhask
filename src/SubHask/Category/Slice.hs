module SubHask.Category.Slice
    where

import GHC.Prim
import qualified Prelude as P

import SubHask.Category

-------------------------------------------------------------------------------

data Comma cat1 cat2 cat3 a b = Comma (cat1 a b) (cat2 a b)

instance 
    ( Category cat1
    , Category cat2
    , Category cat3
    ) => Category (Comma cat1 cat2 cat3) 
        where

    type ValidCategory (Comma cat1 cat2 cat3) a b = 
        ( ValidCategory cat1 a b
        , ValidCategory cat2 a b
        )

    id = Comma id id
    (Comma f1 g1).(Comma f2 g2) = Comma (f1.f2) (g1.g2)

-- runComma :: ValidCategory (Comma cat1 cat2 cat3) a b =>
--     (Comma cat1 cat2 cat3) a b -> cat3 a b -> cat3 a b

-------------------------------------------------------------------------------

data (cat / (obj :: *)) (a :: *) (b :: *) = Slice (cat a b) 

instance Category cat => Category (cat/obj) where
    type ValidCategory (cat/obj) (a :: *) (b :: *) = 
        ( ValidCategory cat a obj
        , ValidCategory cat b obj
        , ValidCategory cat a b
        , Category cat
        )

    id = Slice id
    (Slice f).(Slice g) = Slice $ f.g

runSlice :: ValidCategory (cat/obj) a b => (cat/obj) a b -> (cat b obj) -> (cat a obj)
runSlice (Slice cat1) cat2 = cat2.cat1

