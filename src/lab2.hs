-- [Lab](https://uu-afp.github.io/as2.html)

-- 0. Instances and utilities
-- Exercise 0.1: Give instances for the three standard type classes for functors for the following data types

data Tree a = Leaf a | Node (Tree a) (Tree a)
data RoseTree a = RoseNode a [RoseTree a] | RoseLeaf

instance Functor Tree where 
  fmap f (Leaf a)     = Leaf $ f a
  fmap f (Node t1 t2) = Node (fmap f t1) (fmap f t2)

-- instance Functor Tree => Applicative Tree where 
--   pure 

-- instance Applicative Tree => Monad Tree where 
--   return 

-- 1. Monads for a gambling game:
-- Calculate the probability of tossing a coin six times and the amount of heads being greater than or equal to the amount of eyes on rolling a dice.

data Coin    = H | T
data Dice    = D1 | D2 | D3 | D4 | D5 | D6
data Outcome = Win | Lose

-- The tossing of a Coin and rolling of a Dice is given by the monadic interface MonadGamble

class Monad m => MonadGamble m where 
  toss :: m Coin 
  roll :: m Dice

-- Exercise 1.1: Write a function `game :: MonadGamble m => m Outcome` that implementes the game above.

-- game :: MonadGamble m => m Outcome
-- game = 

-- 2. Instrumented `State` monad 

-- 3. Parsing with error messages
-- We can define the following parser type:

newtype ErrorMsg = ErrorMsg String
newtype Parser a = Parser (String -> Either ErrorMsg (a, String))

-- Exercise 3.1: Write the `Functor`, `Applicative`, `Monad`, and `Alternative` instances for the parser type above.

instance Functor Parser where
  fmap f p = Parser 


-- 4. Teletype IO