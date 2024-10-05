module EightBitAdder where

import Clash.Prelude
import GHC.TypeLits (KnownNat)

--  Truth table (full adder)
--  -----------
--   A  B  C  Y  C1
--   0  0  0  0  0
--   0  0  1  1  0
--   0  1  0  1  0
--   0  1  1  0  1
--   1  0  0  1  0
--   1  0  1  0  1
--   1  1  0  0  1
--   1  1  1  1  1
--
fullAdder :: Bit -> Bit -> Bit -> (Bit, Bit)
fullAdder a b c = (y, c1)
  where y = (a .|. b .|. c) .&. (a `xor` b `xor` c)
        c1 = (a .&. b) .|. (b .&. c) .|. (c .&. a)


-- forall n . makes the function generic over any natural number n.
-- KnownNat n ensures n is a compile-time known natural number, so the function can safely work with vectors of size n.
rippleCarryAdder :: forall n . KnownNat n => Vec n Bit -> Vec n Bit -> Bit -> (Vec n Bit, Bit)
rippleCarryAdder Nil Nil cin = (Nil, cin)
rippleCarryAdder (as :< a) (bs :< b) cin =
  let 
    (y, cout) = fullAdder a b cin 
    (ys, cfinal) = rippleCarryAdder as bs cout
  in 
    (ys :< y, cfinal)



-- 8 bit rippple carry adder
topEntity:: Vec 8 Bit -> Vec 8 Bit -> Bit -> (Vec 8 Bit, Bit)
topEntity= rippleCarryAdder

