{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,193) ([128,0,2048,0,0,16198,18,0,0,18176,4671,0,54272,124,8,0,0,1,0,16,24576,9204,1,2048,0,62560,291,0,0,0,0,0,0,0,0,0,17920,4671,24576,9204,1,16384,2031,0,0,0,0,0,0,0,16384,1999,128,0,0,64,0,2048,0,16,0,62560,291,17920,4671,24576,9204,1,16198,18,62560,291,17920,4671,24576,9204,1,16198,18,62560,291,17920,4671,0,54272,124,0,0,0,31988,0,53056,7,62464,124,16384,1999,0,31988,0,0,0,0,0,0,12,0,192,0,53056,24583,9204,1,16198,18,62560,291,22016,4671,0,0,0,16326,18,0,0,0,0,24576,9206,1,16198,18,0,0,50688,4671,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTokens","Program","Exps","Exp","Cmp","progstart","progend","let","const","if","then","else","while","end","throw","print","read","str","var","int","':='","'='","'+'","'-'","'*'","'/'","'('","')'","'<'","'>'","'<='","'>='","'!='","%eof"]
        bit_start = st * 36
        bit_end = (st + 1) * 36
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..35]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (8) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (8) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (10) = happyShift action_7
action_2 (11) = happyShift action_8
action_2 (15) = happyShift action_9
action_2 (17) = happyShift action_10
action_2 (18) = happyShift action_11
action_2 (19) = happyShift action_12
action_2 (20) = happyShift action_13
action_2 (21) = happyShift action_14
action_2 (22) = happyShift action_15
action_2 (26) = happyShift action_16
action_2 (29) = happyShift action_17
action_2 (5) = happyGoto action_4
action_2 (6) = happyGoto action_5
action_2 (7) = happyGoto action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (36) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (9) = happyShift action_38
action_4 (10) = happyShift action_7
action_4 (11) = happyShift action_8
action_4 (15) = happyShift action_9
action_4 (17) = happyShift action_10
action_4 (18) = happyShift action_11
action_4 (19) = happyShift action_12
action_4 (20) = happyShift action_13
action_4 (21) = happyShift action_14
action_4 (22) = happyShift action_15
action_4 (26) = happyShift action_16
action_4 (29) = happyShift action_17
action_4 (6) = happyGoto action_37
action_4 (7) = happyGoto action_6
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (23) = happyShift action_27
action_5 (25) = happyShift action_28
action_5 (26) = happyShift action_29
action_5 (27) = happyShift action_30
action_5 (28) = happyShift action_31
action_5 (31) = happyShift action_32
action_5 (32) = happyShift action_33
action_5 (33) = happyShift action_34
action_5 (34) = happyShift action_35
action_5 (35) = happyShift action_36
action_5 _ = happyReduce_2

action_6 (12) = happyShift action_26
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (21) = happyShift action_25
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (21) = happyShift action_24
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (10) = happyShift action_7
action_9 (11) = happyShift action_8
action_9 (15) = happyShift action_9
action_9 (17) = happyShift action_10
action_9 (18) = happyShift action_11
action_9 (19) = happyShift action_12
action_9 (20) = happyShift action_13
action_9 (21) = happyShift action_14
action_9 (22) = happyShift action_15
action_9 (26) = happyShift action_16
action_9 (29) = happyShift action_17
action_9 (6) = happyGoto action_22
action_9 (7) = happyGoto action_23
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (20) = happyShift action_21
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (10) = happyShift action_7
action_11 (11) = happyShift action_8
action_11 (15) = happyShift action_9
action_11 (17) = happyShift action_10
action_11 (18) = happyShift action_11
action_11 (19) = happyShift action_12
action_11 (20) = happyShift action_13
action_11 (21) = happyShift action_14
action_11 (22) = happyShift action_15
action_11 (26) = happyShift action_16
action_11 (29) = happyShift action_17
action_11 (6) = happyGoto action_20
action_11 (7) = happyGoto action_6
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_16

action_13 _ = happyReduce_18

action_14 _ = happyReduce_19

action_15 _ = happyReduce_17

action_16 (10) = happyShift action_7
action_16 (11) = happyShift action_8
action_16 (15) = happyShift action_9
action_16 (17) = happyShift action_10
action_16 (18) = happyShift action_11
action_16 (19) = happyShift action_12
action_16 (20) = happyShift action_13
action_16 (21) = happyShift action_14
action_16 (22) = happyShift action_15
action_16 (26) = happyShift action_16
action_16 (29) = happyShift action_17
action_16 (6) = happyGoto action_19
action_16 (7) = happyGoto action_6
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_7
action_17 (11) = happyShift action_8
action_17 (15) = happyShift action_9
action_17 (17) = happyShift action_10
action_17 (18) = happyShift action_11
action_17 (19) = happyShift action_12
action_17 (20) = happyShift action_13
action_17 (21) = happyShift action_14
action_17 (22) = happyShift action_15
action_17 (26) = happyShift action_16
action_17 (29) = happyShift action_17
action_17 (6) = happyGoto action_18
action_17 (7) = happyGoto action_6
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (23) = happyShift action_27
action_18 (25) = happyShift action_28
action_18 (26) = happyShift action_29
action_18 (27) = happyShift action_30
action_18 (28) = happyShift action_31
action_18 (30) = happyShift action_53
action_18 (31) = happyShift action_32
action_18 (32) = happyShift action_33
action_18 (33) = happyShift action_34
action_18 (34) = happyShift action_35
action_18 (35) = happyShift action_36
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (23) = happyShift action_27
action_19 (31) = happyShift action_32
action_19 (32) = happyShift action_33
action_19 (33) = happyShift action_34
action_19 (34) = happyShift action_35
action_19 (35) = happyShift action_36
action_19 _ = happyReduce_13

action_20 (23) = happyShift action_27
action_20 (25) = happyShift action_28
action_20 (26) = happyShift action_29
action_20 (27) = happyShift action_30
action_20 (28) = happyShift action_31
action_20 (31) = happyShift action_32
action_20 (32) = happyShift action_33
action_20 (33) = happyShift action_34
action_20 (34) = happyShift action_35
action_20 (35) = happyShift action_36
action_20 _ = happyReduce_15

action_21 _ = happyReduce_14

action_22 (23) = happyShift action_27
action_22 (25) = happyShift action_28
action_22 (26) = happyShift action_29
action_22 (27) = happyShift action_30
action_22 (28) = happyShift action_31
action_22 (31) = happyShift action_32
action_22 (32) = happyShift action_33
action_22 (33) = happyShift action_34
action_22 (34) = happyShift action_35
action_22 (35) = happyShift action_36
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (12) = happyShift action_52
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (23) = happyShift action_51
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (24) = happyShift action_50
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (13) = happyShift action_49
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (10) = happyShift action_7
action_27 (11) = happyShift action_8
action_27 (15) = happyShift action_9
action_27 (17) = happyShift action_10
action_27 (18) = happyShift action_11
action_27 (19) = happyShift action_12
action_27 (20) = happyShift action_13
action_27 (21) = happyShift action_14
action_27 (22) = happyShift action_15
action_27 (26) = happyShift action_16
action_27 (29) = happyShift action_17
action_27 (6) = happyGoto action_48
action_27 (7) = happyGoto action_6
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (10) = happyShift action_7
action_28 (11) = happyShift action_8
action_28 (15) = happyShift action_9
action_28 (17) = happyShift action_10
action_28 (18) = happyShift action_11
action_28 (19) = happyShift action_12
action_28 (20) = happyShift action_13
action_28 (21) = happyShift action_14
action_28 (22) = happyShift action_15
action_28 (26) = happyShift action_16
action_28 (29) = happyShift action_17
action_28 (6) = happyGoto action_47
action_28 (7) = happyGoto action_6
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (10) = happyShift action_7
action_29 (11) = happyShift action_8
action_29 (15) = happyShift action_9
action_29 (17) = happyShift action_10
action_29 (18) = happyShift action_11
action_29 (19) = happyShift action_12
action_29 (20) = happyShift action_13
action_29 (21) = happyShift action_14
action_29 (22) = happyShift action_15
action_29 (26) = happyShift action_16
action_29 (29) = happyShift action_17
action_29 (6) = happyGoto action_46
action_29 (7) = happyGoto action_6
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (10) = happyShift action_7
action_30 (11) = happyShift action_8
action_30 (15) = happyShift action_9
action_30 (17) = happyShift action_10
action_30 (18) = happyShift action_11
action_30 (19) = happyShift action_12
action_30 (20) = happyShift action_13
action_30 (21) = happyShift action_14
action_30 (22) = happyShift action_15
action_30 (26) = happyShift action_16
action_30 (29) = happyShift action_17
action_30 (6) = happyGoto action_45
action_30 (7) = happyGoto action_6
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (10) = happyShift action_7
action_31 (11) = happyShift action_8
action_31 (15) = happyShift action_9
action_31 (17) = happyShift action_10
action_31 (18) = happyShift action_11
action_31 (19) = happyShift action_12
action_31 (20) = happyShift action_13
action_31 (21) = happyShift action_14
action_31 (22) = happyShift action_15
action_31 (26) = happyShift action_16
action_31 (29) = happyShift action_17
action_31 (6) = happyGoto action_44
action_31 (7) = happyGoto action_6
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (10) = happyShift action_7
action_32 (11) = happyShift action_8
action_32 (15) = happyShift action_9
action_32 (17) = happyShift action_10
action_32 (18) = happyShift action_11
action_32 (19) = happyShift action_12
action_32 (20) = happyShift action_13
action_32 (21) = happyShift action_14
action_32 (22) = happyShift action_15
action_32 (26) = happyShift action_16
action_32 (29) = happyShift action_17
action_32 (6) = happyGoto action_43
action_32 (7) = happyGoto action_6
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (10) = happyShift action_7
action_33 (11) = happyShift action_8
action_33 (15) = happyShift action_9
action_33 (17) = happyShift action_10
action_33 (18) = happyShift action_11
action_33 (19) = happyShift action_12
action_33 (20) = happyShift action_13
action_33 (21) = happyShift action_14
action_33 (22) = happyShift action_15
action_33 (26) = happyShift action_16
action_33 (29) = happyShift action_17
action_33 (6) = happyGoto action_42
action_33 (7) = happyGoto action_6
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (10) = happyShift action_7
action_34 (11) = happyShift action_8
action_34 (15) = happyShift action_9
action_34 (17) = happyShift action_10
action_34 (18) = happyShift action_11
action_34 (19) = happyShift action_12
action_34 (20) = happyShift action_13
action_34 (21) = happyShift action_14
action_34 (22) = happyShift action_15
action_34 (26) = happyShift action_16
action_34 (29) = happyShift action_17
action_34 (6) = happyGoto action_41
action_34 (7) = happyGoto action_6
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (10) = happyShift action_7
action_35 (11) = happyShift action_8
action_35 (15) = happyShift action_9
action_35 (17) = happyShift action_10
action_35 (18) = happyShift action_11
action_35 (19) = happyShift action_12
action_35 (20) = happyShift action_13
action_35 (21) = happyShift action_14
action_35 (22) = happyShift action_15
action_35 (26) = happyShift action_16
action_35 (29) = happyShift action_17
action_35 (6) = happyGoto action_40
action_35 (7) = happyGoto action_6
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (10) = happyShift action_7
action_36 (11) = happyShift action_8
action_36 (15) = happyShift action_9
action_36 (17) = happyShift action_10
action_36 (18) = happyShift action_11
action_36 (19) = happyShift action_12
action_36 (20) = happyShift action_13
action_36 (21) = happyShift action_14
action_36 (22) = happyShift action_15
action_36 (26) = happyShift action_16
action_36 (29) = happyShift action_17
action_36 (6) = happyGoto action_39
action_36 (7) = happyGoto action_6
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (23) = happyShift action_27
action_37 (25) = happyShift action_28
action_37 (26) = happyShift action_29
action_37 (27) = happyShift action_30
action_37 (28) = happyShift action_31
action_37 (31) = happyShift action_32
action_37 (32) = happyShift action_33
action_37 (33) = happyShift action_34
action_37 (34) = happyShift action_35
action_37 (35) = happyShift action_36
action_37 _ = happyReduce_3

action_38 _ = happyReduce_1

action_39 (23) = happyShift action_27
action_39 (25) = happyShift action_28
action_39 (26) = happyShift action_29
action_39 (27) = happyShift action_30
action_39 (28) = happyShift action_31
action_39 (31) = happyShift action_32
action_39 (32) = happyShift action_33
action_39 (33) = happyShift action_34
action_39 (34) = happyShift action_35
action_39 (35) = happyShift action_36
action_39 _ = happyReduce_25

action_40 (23) = happyShift action_27
action_40 (25) = happyShift action_28
action_40 (26) = happyShift action_29
action_40 (27) = happyShift action_30
action_40 (28) = happyShift action_31
action_40 (31) = happyShift action_32
action_40 (32) = happyShift action_33
action_40 (33) = happyShift action_34
action_40 (34) = happyShift action_35
action_40 (35) = happyShift action_36
action_40 _ = happyReduce_23

action_41 (23) = happyShift action_27
action_41 (25) = happyShift action_28
action_41 (26) = happyShift action_29
action_41 (27) = happyShift action_30
action_41 (28) = happyShift action_31
action_41 (31) = happyShift action_32
action_41 (32) = happyShift action_33
action_41 (33) = happyShift action_34
action_41 (34) = happyShift action_35
action_41 (35) = happyShift action_36
action_41 _ = happyReduce_24

action_42 (23) = happyShift action_27
action_42 (25) = happyShift action_28
action_42 (26) = happyShift action_29
action_42 (27) = happyShift action_30
action_42 (28) = happyShift action_31
action_42 (31) = happyShift action_32
action_42 (32) = happyShift action_33
action_42 (33) = happyShift action_34
action_42 (34) = happyShift action_35
action_42 (35) = happyShift action_36
action_42 _ = happyReduce_21

action_43 (23) = happyShift action_27
action_43 (25) = happyShift action_28
action_43 (26) = happyShift action_29
action_43 (27) = happyShift action_30
action_43 (28) = happyShift action_31
action_43 (31) = happyShift action_32
action_43 (32) = happyShift action_33
action_43 (33) = happyShift action_34
action_43 (34) = happyShift action_35
action_43 (35) = happyShift action_36
action_43 _ = happyReduce_22

action_44 (23) = happyShift action_27
action_44 (31) = happyShift action_32
action_44 (32) = happyShift action_33
action_44 (33) = happyShift action_34
action_44 (34) = happyShift action_35
action_44 (35) = happyShift action_36
action_44 _ = happyReduce_9

action_45 (23) = happyShift action_27
action_45 (31) = happyShift action_32
action_45 (32) = happyShift action_33
action_45 (33) = happyShift action_34
action_45 (34) = happyShift action_35
action_45 (35) = happyShift action_36
action_45 _ = happyReduce_8

action_46 (23) = happyShift action_27
action_46 (27) = happyShift action_30
action_46 (28) = happyShift action_31
action_46 (31) = happyShift action_32
action_46 (32) = happyShift action_33
action_46 (33) = happyShift action_34
action_46 (34) = happyShift action_35
action_46 (35) = happyShift action_36
action_46 _ = happyReduce_7

action_47 (23) = happyShift action_27
action_47 (27) = happyShift action_30
action_47 (28) = happyShift action_31
action_47 (31) = happyShift action_32
action_47 (32) = happyShift action_33
action_47 (33) = happyShift action_34
action_47 (34) = happyShift action_35
action_47 (35) = happyShift action_36
action_47 _ = happyReduce_6

action_48 (23) = happyShift action_27
action_48 (25) = happyShift action_28
action_48 (26) = happyShift action_29
action_48 (27) = happyShift action_30
action_48 (28) = happyShift action_31
action_48 (31) = happyShift action_32
action_48 (32) = happyShift action_33
action_48 (33) = happyShift action_34
action_48 (34) = happyShift action_35
action_48 (35) = happyShift action_36
action_48 _ = happyReduce_20

action_49 (10) = happyShift action_7
action_49 (11) = happyShift action_8
action_49 (15) = happyShift action_9
action_49 (17) = happyShift action_10
action_49 (18) = happyShift action_11
action_49 (19) = happyShift action_12
action_49 (20) = happyShift action_13
action_49 (21) = happyShift action_14
action_49 (22) = happyShift action_15
action_49 (26) = happyShift action_16
action_49 (29) = happyShift action_17
action_49 (5) = happyGoto action_57
action_49 (6) = happyGoto action_5
action_49 (7) = happyGoto action_6
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (10) = happyShift action_7
action_50 (11) = happyShift action_8
action_50 (15) = happyShift action_9
action_50 (17) = happyShift action_10
action_50 (18) = happyShift action_11
action_50 (19) = happyShift action_12
action_50 (20) = happyShift action_13
action_50 (21) = happyShift action_14
action_50 (22) = happyShift action_15
action_50 (26) = happyShift action_16
action_50 (29) = happyShift action_17
action_50 (6) = happyGoto action_56
action_50 (7) = happyGoto action_6
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (10) = happyShift action_7
action_51 (11) = happyShift action_8
action_51 (15) = happyShift action_9
action_51 (17) = happyShift action_10
action_51 (18) = happyShift action_11
action_51 (19) = happyShift action_12
action_51 (20) = happyShift action_13
action_51 (21) = happyShift action_14
action_51 (22) = happyShift action_15
action_51 (26) = happyShift action_16
action_51 (29) = happyShift action_17
action_51 (6) = happyGoto action_55
action_51 (7) = happyGoto action_6
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (10) = happyShift action_7
action_52 (11) = happyShift action_8
action_52 (13) = happyShift action_49
action_52 (15) = happyShift action_9
action_52 (17) = happyShift action_10
action_52 (18) = happyShift action_11
action_52 (19) = happyShift action_12
action_52 (20) = happyShift action_13
action_52 (21) = happyShift action_14
action_52 (22) = happyShift action_15
action_52 (26) = happyShift action_16
action_52 (29) = happyShift action_17
action_52 (5) = happyGoto action_54
action_52 (6) = happyGoto action_5
action_52 (7) = happyGoto action_6
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_12

action_54 (10) = happyShift action_7
action_54 (11) = happyShift action_8
action_54 (15) = happyShift action_9
action_54 (16) = happyShift action_59
action_54 (17) = happyShift action_10
action_54 (18) = happyShift action_11
action_54 (19) = happyShift action_12
action_54 (20) = happyShift action_13
action_54 (21) = happyShift action_14
action_54 (22) = happyShift action_15
action_54 (26) = happyShift action_16
action_54 (29) = happyShift action_17
action_54 (6) = happyGoto action_37
action_54 (7) = happyGoto action_6
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (23) = happyShift action_27
action_55 (25) = happyShift action_28
action_55 (26) = happyShift action_29
action_55 (27) = happyShift action_30
action_55 (28) = happyShift action_31
action_55 (31) = happyShift action_32
action_55 (32) = happyShift action_33
action_55 (33) = happyShift action_34
action_55 (34) = happyShift action_35
action_55 (35) = happyShift action_36
action_55 _ = happyReduce_5

action_56 (23) = happyShift action_27
action_56 (25) = happyShift action_28
action_56 (26) = happyShift action_29
action_56 (27) = happyShift action_30
action_56 (28) = happyShift action_31
action_56 (31) = happyShift action_32
action_56 (32) = happyShift action_33
action_56 (33) = happyShift action_34
action_56 (34) = happyShift action_35
action_56 (35) = happyShift action_36
action_56 _ = happyReduce_4

action_57 (10) = happyShift action_7
action_57 (11) = happyShift action_8
action_57 (14) = happyShift action_58
action_57 (15) = happyShift action_9
action_57 (17) = happyShift action_10
action_57 (18) = happyShift action_11
action_57 (19) = happyShift action_12
action_57 (20) = happyShift action_13
action_57 (21) = happyShift action_14
action_57 (22) = happyShift action_15
action_57 (26) = happyShift action_16
action_57 (29) = happyShift action_17
action_57 (6) = happyGoto action_37
action_57 (7) = happyGoto action_6
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (10) = happyShift action_7
action_58 (11) = happyShift action_8
action_58 (15) = happyShift action_9
action_58 (17) = happyShift action_10
action_58 (18) = happyShift action_11
action_58 (19) = happyShift action_12
action_58 (20) = happyShift action_13
action_58 (21) = happyShift action_14
action_58 (22) = happyShift action_15
action_58 (26) = happyShift action_16
action_58 (29) = happyShift action_17
action_58 (5) = happyGoto action_60
action_58 (6) = happyGoto action_5
action_58 (7) = happyGoto action_6
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_10

action_60 (10) = happyShift action_7
action_60 (11) = happyShift action_8
action_60 (15) = happyShift action_9
action_60 (16) = happyShift action_61
action_60 (17) = happyShift action_10
action_60 (18) = happyShift action_11
action_60 (19) = happyShift action_12
action_60 (20) = happyShift action_13
action_60 (21) = happyShift action_14
action_60 (22) = happyShift action_15
action_60 (26) = happyShift action_16
action_60 (29) = happyShift action_17
action_60 (6) = happyGoto action_37
action_60 (7) = happyGoto action_6
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_11

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Let happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Const happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Times happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Div happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 5 6 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 7 6 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (IfThenElse happy_var_1 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Negate happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  6 happyReduction_14
happyReduction_14 (HappyTerminal (TLit happy_var_2))
	_
	 =  HappyAbsSyn6
		 (Throw happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Print happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  6 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn6
		 (Read
	)

happyReduce_17 = happySpecReduce_1  6 happyReduction_17
happyReduction_17 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn6
		 (Int happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  6 happyReduction_18
happyReduction_18 (HappyTerminal (TLit happy_var_1))
	 =  HappyAbsSyn6
		 (Str happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  6 happyReduction_19
happyReduction_19 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (CmpEq happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  7 happyReduction_21
happyReduction_21 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (CmpGT happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  7 happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (CmpLT happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (CmpGTE happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (CmpLTE happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (CmpNeq happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TProgStart -> cont 8;
	TProgEnd -> cont 9;
	TLet -> cont 10;
	TConst -> cont 11;
	TIf -> cont 12;
	TThen -> cont 13;
	TElse -> cont 14;
	TWhile -> cont 15;
	TEndBlock -> cont 16;
	TThrow -> cont 17;
	TPrint -> cont 18;
	TRead -> cont 19;
	TLit happy_dollar_dollar -> cont 20;
	TVar happy_dollar_dollar -> cont 21;
	TInt happy_dollar_dollar -> cont 22;
	TEqCmp -> cont 23;
	TEq -> cont 24;
	TPlus -> cont 25;
	TMinus -> cont 26;
	TTimes -> cont 27;
	TDiv -> cont 28;
	TLParen -> cont 29;
	TRParen -> cont 30;
	TLArrow -> cont 31;
	TRArrow -> cont 32;
	TLEArrow -> cont 33;
	TREArrow -> cont 34;
	TNeq -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
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
         | Throw String
         | Print Exp
         | Read
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
{-# LINE 1 "/home/sriram/.stack/programs/x86_64-linux/ghc-tinfo6-8.6.5/lib/ghc-8.6.5/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc2729920_0/ghc_2.h" #-}
































































































































































































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
