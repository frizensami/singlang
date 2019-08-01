{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,180) ([51392,147,58464,73,0,3995,32,0,4096,0,2048,0,20259,32770,10129,1,0,0,0,0,0,6144,4729,35840,2364,17920,1182,0,63920,0,32504,0,0,0,0,0,3999,32,0,16384,0,8192,0,8,32768,10129,49153,37832,24576,18916,12288,9458,6144,4729,35840,2364,17920,1182,8960,591,37248,295,51392,147,0,7998,0,3999,32768,1999,49152,999,57344,499,0,0,0,0,24576,0,12288,0,40704,6159,4729,35840,2364,17920,1182,11008,591,0,0,55488,147,0,0,0,0,31128,18,15500,9,0,0,20323,2,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTokens","Exps","Exp","Cmp","let","const","if","then","else","while","end","throw","print","str","var","int","'='","'+'","'-'","'*'","'/'","'('","')'","'<'","'>'","'<='","'>='","'!='","%eof"]
        bit_start = st * 31
        bit_end = (st + 1) * 31
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..30]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (7) = happyShift action_4
action_0 (8) = happyShift action_5
action_0 (12) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (17) = happyShift action_9
action_0 (18) = happyShift action_10
action_0 (21) = happyShift action_11
action_0 (24) = happyShift action_12
action_0 (4) = happyGoto action_13
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (7) = happyShift action_4
action_1 (8) = happyShift action_5
action_1 (12) = happyShift action_6
action_1 (15) = happyShift action_7
action_1 (16) = happyShift action_8
action_1 (17) = happyShift action_9
action_1 (18) = happyShift action_10
action_1 (21) = happyShift action_11
action_1 (24) = happyShift action_12
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (19) = happyShift action_23
action_2 (20) = happyShift action_24
action_2 (21) = happyShift action_25
action_2 (22) = happyShift action_26
action_2 (23) = happyShift action_27
action_2 (26) = happyShift action_28
action_2 (27) = happyShift action_29
action_2 (28) = happyShift action_30
action_2 (29) = happyShift action_31
action_2 (30) = happyShift action_32
action_2 _ = happyReduce_1

action_3 (9) = happyShift action_22
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (17) = happyShift action_21
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (17) = happyShift action_20
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (7) = happyShift action_4
action_6 (8) = happyShift action_5
action_6 (12) = happyShift action_6
action_6 (15) = happyShift action_7
action_6 (16) = happyShift action_8
action_6 (17) = happyShift action_9
action_6 (18) = happyShift action_10
action_6 (21) = happyShift action_11
action_6 (24) = happyShift action_12
action_6 (5) = happyGoto action_18
action_6 (6) = happyGoto action_19
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (7) = happyShift action_4
action_7 (8) = happyShift action_5
action_7 (12) = happyShift action_6
action_7 (15) = happyShift action_7
action_7 (16) = happyShift action_8
action_7 (17) = happyShift action_9
action_7 (18) = happyShift action_10
action_7 (21) = happyShift action_11
action_7 (24) = happyShift action_12
action_7 (5) = happyGoto action_17
action_7 (6) = happyGoto action_3
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_15

action_9 _ = happyReduce_16

action_10 _ = happyReduce_14

action_11 (7) = happyShift action_4
action_11 (8) = happyShift action_5
action_11 (12) = happyShift action_6
action_11 (15) = happyShift action_7
action_11 (16) = happyShift action_8
action_11 (17) = happyShift action_9
action_11 (18) = happyShift action_10
action_11 (21) = happyShift action_11
action_11 (24) = happyShift action_12
action_11 (5) = happyGoto action_16
action_11 (6) = happyGoto action_3
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (7) = happyShift action_4
action_12 (8) = happyShift action_5
action_12 (12) = happyShift action_6
action_12 (15) = happyShift action_7
action_12 (16) = happyShift action_8
action_12 (17) = happyShift action_9
action_12 (18) = happyShift action_10
action_12 (21) = happyShift action_11
action_12 (24) = happyShift action_12
action_12 (5) = happyGoto action_15
action_12 (6) = happyGoto action_3
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (7) = happyShift action_4
action_13 (8) = happyShift action_5
action_13 (12) = happyShift action_6
action_13 (15) = happyShift action_7
action_13 (16) = happyShift action_8
action_13 (17) = happyShift action_9
action_13 (18) = happyShift action_10
action_13 (21) = happyShift action_11
action_13 (24) = happyShift action_12
action_13 (31) = happyAccept
action_13 (5) = happyGoto action_14
action_13 (6) = happyGoto action_3
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (19) = happyShift action_23
action_14 (20) = happyShift action_24
action_14 (21) = happyShift action_25
action_14 (22) = happyShift action_26
action_14 (23) = happyShift action_27
action_14 (26) = happyShift action_28
action_14 (27) = happyShift action_29
action_14 (28) = happyShift action_30
action_14 (29) = happyShift action_31
action_14 (30) = happyShift action_32
action_14 _ = happyReduce_2

action_15 (19) = happyShift action_23
action_15 (20) = happyShift action_24
action_15 (21) = happyShift action_25
action_15 (22) = happyShift action_26
action_15 (23) = happyShift action_27
action_15 (25) = happyShift action_47
action_15 (26) = happyShift action_28
action_15 (27) = happyShift action_29
action_15 (28) = happyShift action_30
action_15 (29) = happyShift action_31
action_15 (30) = happyShift action_32
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (19) = happyShift action_23
action_16 (26) = happyShift action_28
action_16 (27) = happyShift action_29
action_16 (28) = happyShift action_30
action_16 (29) = happyShift action_31
action_16 (30) = happyShift action_32
action_16 _ = happyReduce_12

action_17 (19) = happyShift action_23
action_17 (20) = happyShift action_24
action_17 (21) = happyShift action_25
action_17 (22) = happyShift action_26
action_17 (23) = happyShift action_27
action_17 (26) = happyShift action_28
action_17 (27) = happyShift action_29
action_17 (28) = happyShift action_30
action_17 (29) = happyShift action_31
action_17 (30) = happyShift action_32
action_17 _ = happyReduce_13

action_18 (19) = happyShift action_23
action_18 (20) = happyShift action_24
action_18 (21) = happyShift action_25
action_18 (22) = happyShift action_26
action_18 (23) = happyShift action_27
action_18 (26) = happyShift action_28
action_18 (27) = happyShift action_29
action_18 (28) = happyShift action_30
action_18 (29) = happyShift action_31
action_18 (30) = happyShift action_32
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (9) = happyShift action_46
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (19) = happyShift action_45
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (19) = happyShift action_44
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_43
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (7) = happyShift action_4
action_23 (8) = happyShift action_5
action_23 (12) = happyShift action_6
action_23 (15) = happyShift action_7
action_23 (16) = happyShift action_8
action_23 (17) = happyShift action_9
action_23 (18) = happyShift action_10
action_23 (21) = happyShift action_11
action_23 (24) = happyShift action_12
action_23 (5) = happyGoto action_42
action_23 (6) = happyGoto action_3
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (7) = happyShift action_4
action_24 (8) = happyShift action_5
action_24 (12) = happyShift action_6
action_24 (15) = happyShift action_7
action_24 (16) = happyShift action_8
action_24 (17) = happyShift action_9
action_24 (18) = happyShift action_10
action_24 (21) = happyShift action_11
action_24 (24) = happyShift action_12
action_24 (5) = happyGoto action_41
action_24 (6) = happyGoto action_3
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (7) = happyShift action_4
action_25 (8) = happyShift action_5
action_25 (12) = happyShift action_6
action_25 (15) = happyShift action_7
action_25 (16) = happyShift action_8
action_25 (17) = happyShift action_9
action_25 (18) = happyShift action_10
action_25 (21) = happyShift action_11
action_25 (24) = happyShift action_12
action_25 (5) = happyGoto action_40
action_25 (6) = happyGoto action_3
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (7) = happyShift action_4
action_26 (8) = happyShift action_5
action_26 (12) = happyShift action_6
action_26 (15) = happyShift action_7
action_26 (16) = happyShift action_8
action_26 (17) = happyShift action_9
action_26 (18) = happyShift action_10
action_26 (21) = happyShift action_11
action_26 (24) = happyShift action_12
action_26 (5) = happyGoto action_39
action_26 (6) = happyGoto action_3
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (7) = happyShift action_4
action_27 (8) = happyShift action_5
action_27 (12) = happyShift action_6
action_27 (15) = happyShift action_7
action_27 (16) = happyShift action_8
action_27 (17) = happyShift action_9
action_27 (18) = happyShift action_10
action_27 (21) = happyShift action_11
action_27 (24) = happyShift action_12
action_27 (5) = happyGoto action_38
action_27 (6) = happyGoto action_3
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (7) = happyShift action_4
action_28 (8) = happyShift action_5
action_28 (12) = happyShift action_6
action_28 (15) = happyShift action_7
action_28 (16) = happyShift action_8
action_28 (17) = happyShift action_9
action_28 (18) = happyShift action_10
action_28 (21) = happyShift action_11
action_28 (24) = happyShift action_12
action_28 (5) = happyGoto action_37
action_28 (6) = happyGoto action_3
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (7) = happyShift action_4
action_29 (8) = happyShift action_5
action_29 (12) = happyShift action_6
action_29 (15) = happyShift action_7
action_29 (16) = happyShift action_8
action_29 (17) = happyShift action_9
action_29 (18) = happyShift action_10
action_29 (21) = happyShift action_11
action_29 (24) = happyShift action_12
action_29 (5) = happyGoto action_36
action_29 (6) = happyGoto action_3
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (7) = happyShift action_4
action_30 (8) = happyShift action_5
action_30 (12) = happyShift action_6
action_30 (15) = happyShift action_7
action_30 (16) = happyShift action_8
action_30 (17) = happyShift action_9
action_30 (18) = happyShift action_10
action_30 (21) = happyShift action_11
action_30 (24) = happyShift action_12
action_30 (5) = happyGoto action_35
action_30 (6) = happyGoto action_3
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (7) = happyShift action_4
action_31 (8) = happyShift action_5
action_31 (12) = happyShift action_6
action_31 (15) = happyShift action_7
action_31 (16) = happyShift action_8
action_31 (17) = happyShift action_9
action_31 (18) = happyShift action_10
action_31 (21) = happyShift action_11
action_31 (24) = happyShift action_12
action_31 (5) = happyGoto action_34
action_31 (6) = happyGoto action_3
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (7) = happyShift action_4
action_32 (8) = happyShift action_5
action_32 (12) = happyShift action_6
action_32 (15) = happyShift action_7
action_32 (16) = happyShift action_8
action_32 (17) = happyShift action_9
action_32 (18) = happyShift action_10
action_32 (21) = happyShift action_11
action_32 (24) = happyShift action_12
action_32 (5) = happyGoto action_33
action_32 (6) = happyGoto action_3
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (19) = happyShift action_23
action_33 (20) = happyShift action_24
action_33 (21) = happyShift action_25
action_33 (22) = happyShift action_26
action_33 (23) = happyShift action_27
action_33 (26) = happyShift action_28
action_33 (27) = happyShift action_29
action_33 (28) = happyShift action_30
action_33 (29) = happyShift action_31
action_33 (30) = happyShift action_32
action_33 _ = happyReduce_22

action_34 (19) = happyShift action_23
action_34 (20) = happyShift action_24
action_34 (21) = happyShift action_25
action_34 (22) = happyShift action_26
action_34 (23) = happyShift action_27
action_34 (26) = happyShift action_28
action_34 (27) = happyShift action_29
action_34 (28) = happyShift action_30
action_34 (29) = happyShift action_31
action_34 (30) = happyShift action_32
action_34 _ = happyReduce_20

action_35 (19) = happyShift action_23
action_35 (20) = happyShift action_24
action_35 (21) = happyShift action_25
action_35 (22) = happyShift action_26
action_35 (23) = happyShift action_27
action_35 (26) = happyShift action_28
action_35 (27) = happyShift action_29
action_35 (28) = happyShift action_30
action_35 (29) = happyShift action_31
action_35 (30) = happyShift action_32
action_35 _ = happyReduce_21

action_36 (19) = happyShift action_23
action_36 (20) = happyShift action_24
action_36 (21) = happyShift action_25
action_36 (22) = happyShift action_26
action_36 (23) = happyShift action_27
action_36 (26) = happyShift action_28
action_36 (27) = happyShift action_29
action_36 (28) = happyShift action_30
action_36 (29) = happyShift action_31
action_36 (30) = happyShift action_32
action_36 _ = happyReduce_18

action_37 (19) = happyShift action_23
action_37 (20) = happyShift action_24
action_37 (21) = happyShift action_25
action_37 (22) = happyShift action_26
action_37 (23) = happyShift action_27
action_37 (26) = happyShift action_28
action_37 (27) = happyShift action_29
action_37 (28) = happyShift action_30
action_37 (29) = happyShift action_31
action_37 (30) = happyShift action_32
action_37 _ = happyReduce_19

action_38 (19) = happyShift action_23
action_38 (26) = happyShift action_28
action_38 (27) = happyShift action_29
action_38 (28) = happyShift action_30
action_38 (29) = happyShift action_31
action_38 (30) = happyShift action_32
action_38 _ = happyReduce_8

action_39 (19) = happyShift action_23
action_39 (26) = happyShift action_28
action_39 (27) = happyShift action_29
action_39 (28) = happyShift action_30
action_39 (29) = happyShift action_31
action_39 (30) = happyShift action_32
action_39 _ = happyReduce_7

action_40 (19) = happyShift action_23
action_40 (22) = happyShift action_26
action_40 (23) = happyShift action_27
action_40 (26) = happyShift action_28
action_40 (27) = happyShift action_29
action_40 (28) = happyShift action_30
action_40 (29) = happyShift action_31
action_40 (30) = happyShift action_32
action_40 _ = happyReduce_6

action_41 (19) = happyShift action_23
action_41 (22) = happyShift action_26
action_41 (23) = happyShift action_27
action_41 (26) = happyShift action_28
action_41 (27) = happyShift action_29
action_41 (28) = happyShift action_30
action_41 (29) = happyShift action_31
action_41 (30) = happyShift action_32
action_41 _ = happyReduce_5

action_42 (19) = happyShift action_23
action_42 (20) = happyShift action_24
action_42 (21) = happyShift action_25
action_42 (22) = happyShift action_26
action_42 (23) = happyShift action_27
action_42 (26) = happyShift action_28
action_42 (27) = happyShift action_29
action_42 (28) = happyShift action_30
action_42 (29) = happyShift action_31
action_42 (30) = happyShift action_32
action_42 _ = happyReduce_17

action_43 (7) = happyShift action_4
action_43 (8) = happyShift action_5
action_43 (12) = happyShift action_6
action_43 (15) = happyShift action_7
action_43 (16) = happyShift action_8
action_43 (17) = happyShift action_9
action_43 (18) = happyShift action_10
action_43 (21) = happyShift action_11
action_43 (24) = happyShift action_12
action_43 (4) = happyGoto action_51
action_43 (5) = happyGoto action_2
action_43 (6) = happyGoto action_3
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (7) = happyShift action_4
action_44 (8) = happyShift action_5
action_44 (12) = happyShift action_6
action_44 (15) = happyShift action_7
action_44 (16) = happyShift action_8
action_44 (17) = happyShift action_9
action_44 (18) = happyShift action_10
action_44 (21) = happyShift action_11
action_44 (24) = happyShift action_12
action_44 (5) = happyGoto action_50
action_44 (6) = happyGoto action_3
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (7) = happyShift action_4
action_45 (8) = happyShift action_5
action_45 (12) = happyShift action_6
action_45 (15) = happyShift action_7
action_45 (16) = happyShift action_8
action_45 (17) = happyShift action_9
action_45 (18) = happyShift action_10
action_45 (21) = happyShift action_11
action_45 (24) = happyShift action_12
action_45 (5) = happyGoto action_49
action_45 (6) = happyGoto action_3
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (7) = happyShift action_4
action_46 (8) = happyShift action_5
action_46 (10) = happyShift action_43
action_46 (12) = happyShift action_6
action_46 (15) = happyShift action_7
action_46 (16) = happyShift action_8
action_46 (17) = happyShift action_9
action_46 (18) = happyShift action_10
action_46 (21) = happyShift action_11
action_46 (24) = happyShift action_12
action_46 (4) = happyGoto action_48
action_46 (5) = happyGoto action_2
action_46 (6) = happyGoto action_3
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_11

action_48 (7) = happyShift action_4
action_48 (8) = happyShift action_5
action_48 (12) = happyShift action_6
action_48 (13) = happyShift action_53
action_48 (15) = happyShift action_7
action_48 (16) = happyShift action_8
action_48 (17) = happyShift action_9
action_48 (18) = happyShift action_10
action_48 (21) = happyShift action_11
action_48 (24) = happyShift action_12
action_48 (5) = happyGoto action_14
action_48 (6) = happyGoto action_3
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (19) = happyShift action_23
action_49 (20) = happyShift action_24
action_49 (21) = happyShift action_25
action_49 (22) = happyShift action_26
action_49 (23) = happyShift action_27
action_49 (26) = happyShift action_28
action_49 (27) = happyShift action_29
action_49 (28) = happyShift action_30
action_49 (29) = happyShift action_31
action_49 (30) = happyShift action_32
action_49 _ = happyReduce_4

action_50 (19) = happyShift action_23
action_50 (20) = happyShift action_24
action_50 (21) = happyShift action_25
action_50 (22) = happyShift action_26
action_50 (23) = happyShift action_27
action_50 (26) = happyShift action_28
action_50 (27) = happyShift action_29
action_50 (28) = happyShift action_30
action_50 (29) = happyShift action_31
action_50 (30) = happyShift action_32
action_50 _ = happyReduce_3

action_51 (7) = happyShift action_4
action_51 (8) = happyShift action_5
action_51 (11) = happyShift action_52
action_51 (12) = happyShift action_6
action_51 (15) = happyShift action_7
action_51 (16) = happyShift action_8
action_51 (17) = happyShift action_9
action_51 (18) = happyShift action_10
action_51 (21) = happyShift action_11
action_51 (24) = happyShift action_12
action_51 (5) = happyGoto action_14
action_51 (6) = happyGoto action_3
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (7) = happyShift action_4
action_52 (8) = happyShift action_5
action_52 (12) = happyShift action_6
action_52 (15) = happyShift action_7
action_52 (16) = happyShift action_8
action_52 (17) = happyShift action_9
action_52 (18) = happyShift action_10
action_52 (21) = happyShift action_11
action_52 (24) = happyShift action_12
action_52 (4) = happyGoto action_54
action_52 (5) = happyGoto action_2
action_52 (6) = happyGoto action_3
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_9

action_54 (7) = happyShift action_4
action_54 (8) = happyShift action_5
action_54 (12) = happyShift action_6
action_54 (13) = happyShift action_55
action_54 (15) = happyShift action_7
action_54 (16) = happyShift action_8
action_54 (17) = happyShift action_9
action_54 (18) = happyShift action_10
action_54 (21) = happyShift action_11
action_54 (24) = happyShift action_12
action_54 (5) = happyGoto action_14
action_54 (6) = happyGoto action_3
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_10

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Let happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Const happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Times happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Div happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 5 5 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 7 5 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (IfThenElse happy_var_1 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  5 happyReduction_12
happyReduction_12 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Negate happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  5 happyReduction_13
happyReduction_13 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Print happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  5 happyReduction_14
happyReduction_14 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn5
		 (Int happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  5 happyReduction_15
happyReduction_15 (HappyTerminal (TLit happy_var_1))
	 =  HappyAbsSyn5
		 (Str happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  5 happyReduction_16
happyReduction_16 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn5
		 (Var happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (CmpEq happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (CmpGT happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  6 happyReduction_19
happyReduction_19 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (CmpLT happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (CmpGTE happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  6 happyReduction_21
happyReduction_21 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (CmpLTE happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  6 happyReduction_22
happyReduction_22 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (CmpNeq happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 31 31 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLet -> cont 7;
	TConst -> cont 8;
	TIf -> cont 9;
	TThen -> cont 10;
	TElse -> cont 11;
	TWhile -> cont 12;
	TEndBlock -> cont 13;
	TThrow -> cont 14;
	TPrint -> cont 15;
	TLit happy_dollar_dollar -> cont 16;
	TVar happy_dollar_dollar -> cont 17;
	TInt happy_dollar_dollar -> cont 18;
	TEq -> cont 19;
	TPlus -> cont 20;
	TMinus -> cont 21;
	TTimes -> cont 22;
	TDiv -> cont 23;
	TLParen -> cont 24;
	TRParen -> cont 25;
	TLArrow -> cont 26;
	TRArrow -> cont 27;
	TLEArrow -> cont 28;
	TREArrow -> cont 29;
	TNeq -> cont 30;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 31 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseTokens tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exps = Exps [Exp] deriving (Show, Eq)

data Exp = Let String Exp
         | Const String Exp
         | Plus Exp Exp
         | Minus Exp Exp
         | Times Exp Exp
         | Div Exp Exp
         | IfThenElse Cmp [Exp] [Exp]
         | While Cmp [Exp]
         | Negate Exp
         | Brack Exp
         | Print Exp
         | Int Int
         | Str String
         | Var String
         deriving (Show, Eq)

data Cmp = CmpEq Exp Exp 
         | CmpGT Exp Exp 
         | CmpLT Exp Exp 
         | CmpGTE Exp Exp 
         | CmpLTE Exp Exp 
         | CmpNeq Exp Exp 
         deriving (Show, Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/home/sriram/.stack/programs/x86_64-linux/ghc-8.6.5/lib/ghc-8.6.5/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc10118_0/ghc_2.h" #-}
































































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
