module FourBitCounter where

import Clash.Prelude


--
-- counter :: forall n . KnownNat n => Bit -> Unsigned n -> Unsigned n 
-- counter clear count = if bitToBool clear then 0 else count + 1
--
-- -- 4 bit counter
-- topEntity:: Clock System -> Bit -> Unsigned 4 -> Unsigned 4
-- topEntity = exposeClock counter
--

counter :: HiddenClockResetEnable dom => Signal dom (Unsigned 4)
counter = register 0 (counter + 1)

-- topEntity :: HiddenClockResetEnable dom => Signal dom (Unsigned 4)
-- topEntity = counter

topEntity :: Clock System -> Reset System -> Enable System -> Signal System (Unsigned 4)
topEntity = exposeClockResetEnable counter
