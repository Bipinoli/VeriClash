module Instruction where

import Clash.Prelude

-- -------------------- ISA ---------------------------
-- # Move, load, and store instructions
-- MOV R1, R2            // R1 := R2
-- MVI R1, 123           // R1 := 123. 123 in 16-bit immediate value
-- LOD R1, R2, 123       // R1 := Memory(R2 + 123). 123 in 16-bits
-- STR R1, R2, -2        // Memory(R2 - 2) := R1. -2 in 16-bits

-- # ALU instructions
-- ADD R1, R2, R3        // R1 := R2 + R3
-- SUB R1, R2, R3        // R1 := R2 - R3
-- MUL R1, R2, R3        // R1 := R2 * R3

-- AND R1, R2, R3        // R1 := R2 & R3
-- ORR R1, R2, R3        // R1 := R2 | R3
-- NOT R1, R2            // R1 := ~R2 

-- LES R1, R2, R3        // R1 := (R2 < R3) ? 1 : 0
-- GTR R1, R2, R3        // R1 := (R2 > R3) ? 1 : 0

-- # Branch and jump instructions
-- JEZ R1, label         // Jump to label if R1 == 0
-- JNZ R1, label         // Jump to label if R1 != 0
-- JMP label             // Jump to label

-- # End program instruction
-- HLT


-- -------------------- INSTRUCTION FORMAT ----------------------
--   __________________________________________________________________
--  | opcode | r_dest |  r_a  |  r_b  |        immediate val           |
--   ------------------------------------------------------------------
--     4-bit    4-bit    4-bit   4-bit            16-bit
--     <------------------    32-bit  --------------------------------->

-- examples:
--   AND R1, R2, R3
--   --------------
--   opcode:    AND (4-bit)
--   r_dest:    R1  (4-bit)
--   r_a:       R2  (4-bit)
--   r_b:       R3  (4-bit)
--   immediate: 0 (not used)

--   MVI R1, 123
--   --------------
--   opcode:     MVI (4-bit)
--   r_dest:     R1  (4-bit)
--   immediate:  123 (16-bit)
--   r_a, r_b:   0 (not used)


type WordSize = BitVector 32
type R = Unsigned 4
type Imm = Signed 16

data OpCode = OP_HLT 
            | OP_MOV | OP_MVI | OP_LOD | OP_STR
            | OP_ADD | OP_SUB | OP_MUL 
            | OP_AND | OP_ORR | OP_NOT 
            | OP_LES | OP_GTR
            | OP_JEZ | OP_JNZ | OP_JMP
        deriving (Show, Eq)

data Instr = HLT 
            | MOV R R
            | MVI R Imm
            | LOD R R Imm 
            | STR R R Imm 
            | ADD R R R
            | SUB R R R
            | MUL R R R
            | AND R R R
            | ORR R R R
            | NOT R R
            | LES R R R
            | GTR R R R
            | JEZ R Imm 
            | JNZ R Imm 
            | JMP Imm
        deriving (Show, Eq)


nibble2OpCode :: BitVector 4 -> OpCode
nibble2OpCode nib = case nib of
    0x0 -> OP_HLT 
    0x1 -> OP_MOV 
    0x2 -> OP_MVI
    0x3 -> OP_LOD
    0x4 -> OP_STR
    0x5 -> OP_ADD
    0x6 -> OP_SUB
    0x7 -> OP_MUL
    0x8 -> OP_AND
    0x9 -> OP_ORR
    0xa -> OP_NOT
    0xb -> OP_LES
    0xc -> OP_GTR
    0xd -> OP_JEZ
    0xe -> OP_JNZ
    0xf -> OP_JMP

toUnsigned :: KnownNat a => BitVector a -> Unsigned a
toUnsigned = fromIntegral . toInteger

toSigned :: KnownNat a => BitVector a -> Signed a
toSigned = fromIntegral . toInteger

toImmediate :: KnownNat a => BitVector a -> Signed a
toImmediate = fromIntegral . toInteger

toBitVector :: KnownNat a => Signed a -> BitVector a
toBitVector = fromIntegral

decode :: WordSize -> Instr
decode word = case nibble2OpCode (slice d31 d28 word) of 
    OP_HLT -> HLT
    OP_MOV -> MOV (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word))
    OP_MVI -> MVI (toUnsigned (slice d27 d24 word)) (toImmediate (slice d15 d0 word))
    OP_LOD -> LOD (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toImmediate (slice d15 d0 word))
    OP_STR -> STR (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toImmediate (slice d15 d0 word))
    OP_ADD -> ADD (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toUnsigned (slice d19 d16 word))
    OP_SUB -> SUB (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toUnsigned (slice d19 d16 word))
    OP_MUL -> MUL (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toUnsigned (slice d19 d16 word))
    OP_AND -> AND (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toUnsigned (slice d19 d16 word))
    OP_ORR -> ORR (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toUnsigned (slice d19 d16 word))
    OP_NOT -> NOT (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word))
    OP_LES -> LES (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toUnsigned (slice d19 d16 word))
    OP_GTR -> GTR (toUnsigned (slice d27 d24 word)) (toUnsigned (slice d23 d20 word)) (toUnsigned (slice d19 d16 word))
    OP_JEZ -> JEZ (toUnsigned (slice d27 d24 word)) (toImmediate (slice d15 d0 word))
    OP_JNZ -> JNZ (toUnsigned (slice d27 d24 word)) (toImmediate (slice d15 d0 word))
    OP_JMP -> JMP (toImmediate (slice d15 d0 word))