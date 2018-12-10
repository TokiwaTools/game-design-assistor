% math.pl
%%%% Prolog Math Library %%%%

%%% Digits

%% Binary Digits
binary(o).
binary(i).

%% Hex Digits
i(0).
i(1).
i(2).
i(3).
i(4).
i(5).
i(6).
i(7).
i(8).
i(9).
i(a).
i(b).
i(c).
i(d).
i(e).
i(f).

%%% Numbers

%% Binary byte
num(B7, B6, B5, B4, B3, B2, B1, B0) :-
	binary(B0),
	binary(B1),
	binary(B2),
	binary(B3),
	binary(B4),
	binary(B5),
	binary(B6),
	binary(B7).

%% Hex Byte (8bit Signed)
byte(I1, I0) :- i(I0), i(I1).

%% Hex Short (16bit Signed)
short(I3, I2, I1, I0) :- i(I0), i(I1), i(I2), i(I3).

%% Hex int (32bit Signed)
int(I7, I6, I5, I4, I3, I2, I1, I0) :- i(I0), i(I1), i(I2), i(I3), i(I4), i(I5), i(I6), i(I7).

%% Odd / Even Numbers
odd_even(odd).
odd_even(even).

%%% Radix Table (binary <-> hex)

radix_table(o, o, o, o, 0).
radix_table(o, o, o, i, 1).
radix_table(o, o, i, o, 2).
radix_table(o, o, i, i, 3).
radix_table(o, i, o, o, 4).
radix_table(o, i, o, i, 5).
radix_table(o, i, i, o, 6).
radix_table(o, i, i, i, 7).
radix_table(i, o, o, o, 8).
radix_table(i, o, o, i, 9).
radix_table(i, o, i, o, a).
radix_table(i, o, i, i, b).
radix_table(i, i, o, o, c).
radix_table(i, i, o, i, d).
radix_table(i, i, i, o, e).
radix_table(i, i, i, i, f).

%%% Successors

succ(0, 1).
succ(1, 2).
succ(2, 3).
succ(3, 4).
succ(4, 5).
succ(5, 6).
succ(6, 7).
succ(7, 8).
succ(8, 9).
succ(9, a).
succ(a, b).
succ(b, c).
succ(c, d).
succ(d, e).
succ(e, f).

succ_byte(I1, I0, I1, J0) :-
	byte(I1, I0),
	succ(I0, J0).
succ_byte(I1, f, J1, 0) :- succ(I1, J1).

succ_short(I3, I2, I1, I0, I3, I2, J1, J0) :-
	short(I3, I2, I1, I0),
	succ_byte(I1, I0, J1, J0).
succ_short(I3, I2, f, f, I3, J2, 0, 0) :-
	i(I3),
	succ(I2, J2).
succ_short(I3, f, f, f, J3, 0, 0, 0) :- succ(I3, J3).

succ_int(I7, I6, I5, I4, I3, I2, I1, I0, I7, I6, I5, I4, J3, J2, J1, J0) :-
	int(I7, I6, I5, I4, I3, I2, I1, I0),
	succ_short(I3, I2, I1, I0, J3, J2, J1, J0).
succ_int(I7, I6, I5, I4, f, f, f, f, I7, I6, I5, J4, 0, 0, 0, 0) :-
	short(I7, I6, I5, I4),
	succ(I4, J4).
succ_int(I7, I6, I5, f, f, f, f, f, I7, I6, J5, 0, 0, 0, 0, 0) :-
	byte(I7, I6),
	succ(I5, J5).
succ_int(I7, I6, f, f, f, f, f, f, I7, J6, 0, 0, 0, 0, 0, 0) :-
	i(I7),
	succ(I6, J6).
succ_int(I7, f, f, f, f, f, f, f, J7, 0, 0, 0, 0, 0, 0, 0) :-
	succ(I7, J7).

%%% Logical Operations

or_(o, o, o).
or_(o, i, i).
or_(i, o, i).
or_(i, i, i).

and_(o, o, o).
and_(o, i, o).
and_(i, o, o).
and_(i, i, i).

not_(o, i).
not_(i, o).

nor_(o, o, i).
nor_(o, i, o).
nor_(i, o, o).
nor_(i, i, o).

nand_(o, o, i).
nand_(o, i, i).
nand_(i, o, i).
nand_(i, i, o).

xor_(o, o, o).
xor_(o, i, i).
xor_(i, o, i).
xor_(i, i, o).

%%% Converters

%% Radix (binary <-> hex)
conv_radix_byte(B7, B6, B5, B4, B3, B2, B1, B0, I1, I0) :-
	radix_table(B3, B2, B1, B0, I0),
	radix_table(B7, B6, B5, B4, I1).

conv_radix_short(B15, B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0, I3, I2, I1, I0) :-
	conv_radix_byte(B7, B6, B5, B4, B3, B2, B1, B0, I1, I0),
	conv_radix_byte(B15, B14, B13, B12, B11, B10, B9, B8, I3, I2).

conv_radix_int(B31, B30, B29, B28, B27, B26, B25, B24, B23, B22, B21, B20, B19, B18, B17, B16, B15, B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0, I7, I6, I5, I4, I3, I2, I1, I0) :-
	conv_radix_short(B15, B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0, I3, I2, I1, I0),
	conv_radix_short(B31, B30, B29, B28, B27, B26, B25, B24, B23, B22, B21, B20, B19, B18, B17, B16, I7, I6, I5, I4).

%% Complement on one (Binary byte)
conv_complement_on_one(Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0) :-
	not_(Bi7, Bo7),
	not_(Bi6, Bo6),
	not_(Bi5, Bo5),
	not_(Bi4, Bo4),
	not_(Bi3, Bo3),
	not_(Bi2, Bo2),
	not_(Bi1, Bo1),
	not_(Bi0, Bo0).

%% Complement on two (Binary byte)
conv_complement_on_two(Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0) :-
	conv_complement_on_one(Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, Bj7, Bj6, Bj5, Bj4, Bj3, Bj2, Bj1, Bj0),
	plus_(Bj7, Bj6, Bj5, Bj4, Bj3, Bj2, Bj1, Bj0,
		o, o, o, o, o, o, o, i,
		o,
		Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0,
		Co7,
		Overflow),
	binary(Co7),
	binary(Overflow).

%%% Shift Operatinos

%% Logical Right-Shift
shift(lsr, B7, B6, B5, B4, B3, B2, B1, B0, 0, B7, B6, B5, B4, B3, B2, B1, B0) :-
	num(B7, B6, B5, B4, B3, B2, B1, B0).
shift(lsr, Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, N, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0) :-
	binary(Bi0),
	succ(Nm, N),
	shift(lsr, o, Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Nm, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0).

%% Logical Left-Shift
shift(lsl, B7, B6, B5, B4, B3, B2, B1, B0, 0, B7, B6, B5, B4, B3, B2, B1, B0) :-
	num(B7, B6, B5, B4, B3, B2, B1, B0).
shift(lsl, Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, N, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0) :-
	binary(Bi7),
	succ(Nm, N),
	shift(lsl, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, o, Nm, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0).

%% Arithmetic Right-Shift
shift(asr, B7, B6, B5, B4, B3, B2, B1, B0, 0, B7, B6, B5, B4, B3, B2, B1, B0) :-
	num(B7, B6, B5, B4, B3, B2, B1, B0).
shift(asr, Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, N, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0) :-
	binary(Bi0),
	succ(Nm, N),
	shift(asr, Bi7, Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Nm, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0).

%% Arithmetic Left-Shift
shift(asl, B7, B6, B5, B4, B3, B2, B1, B0, 0, B7, B6, B5, B4, B3, B2, B1, B0) :-
	num(B7, B6, B5, B4, B3, B2, B1, B0).
shift(asl, Bi7, Bi6, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, N, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0) :-
	binary(Bi6),
	succ(Nm, N),
	shift(asl, Bi7, Bi5, Bi4, Bi3, Bi2, Bi1, Bi0, o, Nm, Bo7, Bo6, Bo5, Bo4, Bo3, Bo2, Bo1, Bo0).

%%% Full Adder

adder(A, B, X, S, C) :-
	xor_(A, B, S1),
	xor_(S1, X, S),
	and_(A, B, C1),
	and_(S1, X, C2),
	or_(C1, C2, C).

%%% Comparators

%% 4 bit (I < J)
comparator(I, J) :- succ(I, J).
comparator(H, J) :-
	succ(I, J),
	comparator(H, I).

%% Binary byte
eq(
	B7, B6, B5, B4, B3, B2, B1, B0,
	B7, B6, B5, B4, B3, B2, B1, B0,
	i) :-
		num(B7, B6, B5, B4, B3, B2, B1, B0).
eq(
	B7, B6, B5, B4, B3, B2, B1, B0,
	C7, C6, C5, C4, C3, C2, C1, C0,
	o) :-
		\+ eq(B7, B6, B5, B4, B3, B2, B1, B0,
			C7, C6, C5, C4, C3, C2, C1, C0,
			i),
		num(B7, B6, B5, B4, B3, B2, B1, B0),
		num(C7, C6, C5, C4, C3, C2, C1, C0).

%% Hex byte
% I == J
comparator_byte(eq, I1, I0, I1, I0) :- byte(I1, I0).
% I != J
comparator_byte(ne, I1, I0, J1, J0) :-
	\+ comparator_byte(eq, I1, I0, J1, J0),
	short(I1, I0, J1, J0).
% I < J
comparator_byte(lt, I1, I0, I1, J0) :-
	i(I1),
	comparator(I0, J0).
comparator_byte(lt, I1, I0, J1, J0) :-
	byte(I0, J0),
	comparator(I1, J1).
% I <= J
comparator_byte(le, I1, I0, J1, J0) :- comparator_byte(eq, I1, I0, J1, J0).
comparator_byte(le, I1, I0, J1, J0) :- comparator_byte(lt, I1, I0, J1, J0).
% I > J
comparator_byte(gt, I1, I0, J1, J0) :- comparator_byte(lt, J1, J0, I1, I0).
% I >= J
comparator_byte(ge, I1, I0, J1, J0) :- comparator_byte(le, J1, J0, I1, I0).

%% Hex short
comparator_short(eq, I3, I2, I1, I0, I3, I2, I1, I0) :- short(I3, I2, I1, I0).
comparator_short(ne, I3, I2, I1, I0, J3, J2, J1, J0) :-
	\+ comparator_short(eq, I3, I2, I1, I0, J3, J2, J1, J0),
	int(I3, I2, I1, I0, J3, J2, J1, J0).
comparator_short(lt, I3, I2, I1, I0, I3, I2, J1, J0) :-
	byte(I3, I2),
	comparator_byte(lt, I1, I0, J1, J0).
comparator_short(lt, I3, I2, I1, I0, J3, J2, J1, J0) :-
	short(I1, I0, J1, J0),
	comparator_byte(lt, I3, I2, J3, J2).
/*
comparator_short(lt, I3, I2, I1, I0, I3, I2, J1, J0) :-
	short(I3, I2, I0, J0),
	comparator(I1, J1).
comparator_short(lt, I3, I2, I1, I0, I3, I2, I1, J0) :-
	byte(I3, I2),
	i(I1),
	comparator(I0, J0).
*/
comparator_short(le, I3, I2, I1, I0, J3, J2, J1, J0) :- comparator_short(eq, I3, I2, I1, I0, J3, J2, J1, J0).
comparator_short(le, I3, I2, I1, I0, J3, J2, J1, J0) :- comparator_short(lt, I3, I2, I1, I0, J3, J2, J1, J0).
comparator_short(gt, I3, I2, I1, I0, J3, J2, J1, J0) :- comparator_short(lt, J3, J2, J1, J0, I3, I2, I1, I0).
comparator_short(ge, I3, I2, I1, I0, J3, J2, J1, J0) :- comparator_short(le, J3, J2, J1, J0, I3, I2, I1, I0).

%% Hex int
comparator_int(eq, I7, I6, I5, I4, I3, I2, I1, I0, I7, I6, I5, I4, I3, I2, I1, I0) :- int(I7, I6, I5, I4, I3, I2, I1, I0).
comparator_int(ne, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, IJ, J3, J2, J1, J0) :-
	\+ comparator_int(eq, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, IJ, J3, J2, J1, J0),
	int(I7, I6, I5, I4, I3, I2, I1, I0),
	int(J7, J6, J5, IJ, J3, J2, J1, J0).
comparator_int(lt, I7, I6, I5, I4, I3, I2, I1, I0, I7, I6, I5, I4, J3, J2, J1, J0) :-
	short(I7, I6, I5, I4),
	comparator_short(lt, I3, I2, I1, I0, J3, J2, J1, J0).
comparator_int(lt, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, J4, J3, J2, J1, J0) :-
	int(I3, I2, I1, I0, J3, J2, J1, J0),
	comparator_short(lt, I7, I6, I5, I4, J7, J6, J5, J4).
comparator_int(le, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, J4, J3, J2, J1, J0) :- comparator_int(eq, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, J4, J3, J2, J1, J0).
comparator_int(le, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, J4, J3, J2, J1, J0) :- comparator_int(lt, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, J4, J3, J2, J1, J0).
comparator_int(gt, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, J4, J3, J2, J1, J0) :- comparator_int(lt, J7, J6, J5, J4, J3, J2, J1, J0, I7, I6, I5, I4, I3, I2, I1, I0).
comparator_int(ge, I7, I6, I5, I4, I3, I2, I1, I0, J7, J6, J5, J4, J3, J2, J1, J0) :- comparator_int(le, J7, J6, J5, J4, J3, J2, J1, J0, I7, I6, I5, I4, I3, I2, I1, I0).

%%% Arithmetic Operations

%% Addition

% Binary byte
plus_(
	A7, A6, A5, A4, A3, A2, A1, A0,
	B7, B6, B5, B4, B3, B2, B1, B0,
	X0,
	S7, S6, S5, S4, S3, S2, S1, S0,
	C7,
	Overflow) :-
		adder(A0, B0, X0, S0, C0),
		adder(A1, B1, C0, S1, C1),
		adder(A2, B2, C1, S2, C2),
		adder(A3, B3, C2, S3, C3),
		adder(A4, B4, C3, S4, C4),
		adder(A5, B5, C4, S5, C5),
		adder(A6, B6, C5, S6, C6),
		adder(A7, B7, C6, S7, C7),
		xor_(A7, B7, Y1),
		nor_(Y1, o, Y2),
		xor_(B7, S7, Z1),
		and_(Z1, i, Z2),
		and_(Y2, Z2, Overflow).

% Hex byte
plus_byte(
	Ah1, Ah0,
	Bh1, Bh0,
	Sh1, Sh0,
	Overflow) :-
		conv_radix_byte(A7, A6, A5, A4, A3, A2, A1, A0, Ah1, Ah0),
		conv_radix_byte(B7, B6, B5, B4, B3, B2, B1, B0, Bh1, Bh0),
		plus_(A7, A6, A5, A4, A3, A2, A1, A0, B7, B6, B5, B4, B3, B2, B1, B0, o, S7, S6, S5, S4, S3, S2, S1, S0, C7, Overflow),
		binary(C7),
		conv_radix_byte(S7, S6, S5, S4, S3, S2, S1, S0, Sh1, Sh0).

% Hex short
plus_short(
	Ah3, Ah2, Ah1, Ah0,
	Bh3, Bh2, Bh1, Bh0,
	Sh3, Sh2, Sh1, Sh0,
	Overflow) :-
		conv_radix_short(A15, A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0, Ah3, Ah2, Ah1, Ah0),
		conv_radix_short(B15, B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0, Bh3, Bh2, Bh1, Bh0),
		plus_(A7, A6, A5, A4, A3, A2, A1, A0, B7, B6, B5, B4, B3, B2, B1, B0, o, S7, S6, S5, S4, S3, S2, S1, S0, C7, Overflow0),
		binary(Overflow0),
		plus_(A15, A14, A13, A12, A11, A10, A9, A8, B15, B14, B13, B12, B11, B10, B9, B8, C7, S15, S14, S13, S12, S11, S10, S9, S8, C15, Overflow),
		binary(C15),
		conv_radix_short(S15, S14, S13, S12, S11, S10, S9, S8, S7, S6, S5, S4, S3, S2, S1, S0, Sh3, Sh2, Sh1, Sh0).

% Hex int
plus_int(
		Ah7, Ah6, Ah5, Ah4, Ah3, Ah2, Ah1, Ah0,
		Bh7, Bh6, Bh5, Bh4, Bh3, Bh2, Bh1, Bh0,
		Sh7, Sh6, Sh5, Sh4, Sh3, Sh2, Sh1, Sh0,
		Overflow) :-
			conv_radix_int(A31, A30, A29, A28, A27, A26, A25, A24, A23, A22, A21, A20, A19, A18, A17, A16, A15, A14, A13, A12, A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0, Ah7, Ah6, Ah5, Ah4, Ah3, Ah2, Ah1, Ah0),
			conv_radix_int(B31, B30, B29, B28, B27, B26, B25, B24, B23, B22, B21, B20, B19, B18, B17, B16, B15, B14, B13, B12, B11, B10, B9, B8, B7, B6, B5, B4, B3, B2, B1, B0, Bh7, Bh6, Bh5, Bh4, Bh3, Bh2, Bh1, Bh0),
			plus_(A7, A6, A5, A4, A3, A2, A1, A0, B7, B6, B5, B4, B3, B2, B1, B0, o, S7, S6, S5, S4, S3, S2, S1, S0, C7, Overflow0),
			binary(Overflow0),
			plus_(A15, A14, A13, A12, A11, A10, A9, A8, B15, B14, B13, B12, B11, B10, B9, B8, C7, S15, S14, S13, S12, S11, S10, S9, S8, C15, Overflow1),
			binary(Overflow1),
			plus_(A23, A22, A21, A20, A19, A18, A17, A16, B23, B22, B21, B20, B19, B18, B17, B16, C15, S23, S22, S21, S20, S19, S18, S17, S16, C23, Overflow2),
			binary(Overflow2),
			plus_(A31, A30, A29, A28, A27, A26, A25, A24, B31, B30, B29, B28, B27, B26, B25, B24, C23, S31, S30, S29, S28, S27, S26, S25, S24, C31, Overflow),
			binary(C31),
			conv_radix_int(S31, S30, S29, S28, S27, S26, S25, S24, S23, S22, S21, S20, S19, S18, S17, S16, S15, S14, S13, S12, S11, S10, S9, S8, S7, S6, S5, S4, S3, S2, S1, S0, Sh7, Sh6, Sh5, Sh4, Sh3, Sh2, Sh1, Sh0).

%% Subtraction

% Hex byte
minus_byte(
	Ah1, Ah0,
	Bh1, Bh0,
	Sh1, Sh0,
	Overflow) :-
		plus_byte(Sh1, Sh0, Bh1, Bh0, Ah1, Ah0, Overflow).

% Hex short
minus_short(
	Ah3, Ah2, Ah1, Ah0,
	Bh3, Bh2, Bh1, Bh0,
	Sh3, Sh2, Sh1, Sh0,
	Overflow) :-
		plus_short(Sh3, Sh2, Sh1, Sh0, Bh3, Bh2, Bh1, Bh0, Ah3, Ah2, Ah1, Ah0, Overflow).

% Hex int
minus_int(
		Ah7, Ah6, Ah5, Ah4, Ah3, Ah2, Ah1, Ah0,
		Bh7, Bh6, Bh5, Bh4, Bh3, Bh2, Bh1, Bh0,
		Sh7, Sh6, Sh5, Sh4, Sh3, Sh2, Sh1, Sh0,
		Overflow) :-
			plus_int(Sh7, Sh6, Sh5, Sh4, Sh3, Sh2, Sh1, Sh0, Bh7, Bh6, Bh5, Bh4, Bh3, Bh2, Bh1, Bh0, Ah7, Ah6, Ah5, Ah4, Ah3, Ah2, Ah1, Ah0, Overflow).

