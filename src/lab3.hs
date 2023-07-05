-- [Lab](https://uu-afp.github.io/as3.html)

{-# LANGUAGE GADTs, TypeFamilies #-}

-- 0. Contracts

-- data Contract :: * -> * where
--   Pred :: (a -> Bool) -> Contract a
--   Fun  :: Contract a -> Contract b -> Contract (a -> b)


-- assert :: Contract a -> a -> a
-- assert (Pred p)       x = if p x then x else error "contract violation"
-- assert (Fun pre post) f = assert post . f . assert pre

-- Exercise 0.1: Define a contract `true :: Contract a` such that for all values `x` the equation `assert true x == x` holds. Prove this using equational reasoning.

true :: Contract a
true = Pred (\a -> True)

-- Exercise 0.2: Adapt the function `assert` to the new type of `DFun`.

data Contract :: * -> * where
  Pred :: (a -> Bool) -> Contract a
  DFun :: Contract a -> (a -> Contract b) -> Contract (a -> b)

assert :: Contract a -> a -> a
assert (Pred p)        x = if p x then x else error "contract violation"
assert (DFun pre post) f =  \x -> assert (post x) (f (assert pre x)) 