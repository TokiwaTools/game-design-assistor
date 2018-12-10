% math_test.pl
%%%% Test for Prolog Math Library %%%%

%% Anti-Patternも書く
%% 述語もテストする

:- [math].

:- begin_tests(numbers).

	test(binary_byte) :-
		num(i, o, i, i, o, o, i, o),
		\+ num(i, o, i, i, c, x, a, i).
	test(byte) :-
		byte(a, 4),
		\+ byte(g, 9).
	test(short) :-
		short(8, 2, a, c),
		\+ short(a, _, 9, y).
	test(int) :-
		int(3, a, 8, f, c, 4, 6, 0),
		\+ int(a, 0, 3, c, k, j, zz, c).

:- end_tests(numbers).

:- begin_tests(successor).

	test(byte) :-
		succ_byte(
			e, 2,
			e, 3),
		succ_byte(
			6, f,
			7, 0),
		\+ succ_byte(
			c, 9,
			f, a),
		\+ succ_byte(
			f, g,
			f, k).
	test(short) :-
		succ_short(
			5, 2, f, c,
			5, 2, f, d),
		succ_short(
			4, 9, f, f,
			4, a, 0, 0),
		\+ succ_short(
			f, f, f, f,
			0, 0, 0, 0),
		\+ succ_short(
			f, c, e, 5,
			f, c, 4, -).
	test(int) :-
		succ_int(
			4, a, b, 0, 7, 9, 9, e,
			4, a, b, 0, 7, 9, 9, f),
		succ_int(
			3, 7, e, 3, f, f, f, f,
			3, 7, e, 4, 0, 0, 0, 0),
		\+ succ_int(
			8, 4, 4, 4, a, f, d, e,
			0, 0, 3, 5, b, 9, 8, 2),
		\+ succ_int(
			c, y, 4, p, o, o, i, a,
			c, f, 4, 9, 3, e, 2, c).

:- end_tests(successor).

:- begin_tests(radix_converter).

	test(byte) :-
		conv_radix_byte(
			i, i, i, o, o, o, i, o,
			e, 2),
		\+ conv_radix_byte(
			i, o, o, i, i, o, i, o, 
			f, 4),
		\+ conv_radix_byte(
			i, 0, e, c, i, o, e, c,
			4, c).
	test(short) :-
		conv_radix_short(
			o, o, i, o, i, i, o, o, o, i, i, i, o, i, i, i,
			2, c, 7, 7),
		\+ conv_radix_short(
			i, o, o, i, o, i, i, o, i, o, o, i, i, o, i, o,
			5, d, 3, 0),
		\+ conv_radix_short(
			i, o, o, i, o, i, i, o, i, o, o, i, i, o, i, o,
			5, d, p, d).
	test(int) :-
		conv_radix_int(
			i, o, i, i, o, i, o, i, i, o, i, o, i, i, o, o, o, o, i, o, o, o, o, o, o, o, o, o, o, i, o, o,
			b, 5, a, c, 2, 0, 0, 4),
		\+ conv_radix_int(
			i, i, o, i, i, i, i, i, i, o, o, i, i, o, o, i, i, o, o, i, i, i, o, i, o, o, o, i, o, o, i, o,
			e, 3, 6, d, e, f, 0, 8),
		\+ conv_radix_int(
			i, i, o, i, i, i, i, i, e, o, o, i, i, o, c, i, i, o, o, 5, o, i, i, i, o, i, o, i, i, o, i, i,
			e, p, _, e, 9, 00, t, r).

:- end_tests(radix_converter).

:- begin_tests(complement).

	test(on_one) :-
		conv_complement_on_one(
			i, i, o, i, o, o, i, o,
			o, o, i, o, i, i, o, i),
		\+ conv_complement_on_one(
			i, o, i, i, i, i, o, i,
			o, i, o, i, i, o, i, i),
		\+ conv_complement_on_one(
			p, c, o, o, e, o, i, 4,
			o, c, i, 2, i, p, c, i).
	test(on_two) :-
		conv_complement_on_two(
			o, i, i, o, i, i, o, o,
			i, o, o, i, o, i, o, o),
		\+ conv_complement_on_two(
			i, o, o, o, o, o, o, i,
			o, i, o, o, o, o, i, i),
		\+ conv_complement_on_two(
			i, o, o, e, 0, o, o, 0,
			o, i, _, o, o, ii, i, k).

:- end_tests(complement).

:- begin_tests(shift).

	test(lsr) :-
		shift(lsr,
			i, o, i, i, o, o, i, i,
			4,
			o, o, o, o, i, o, i, i),
		\+ shift(lsr,
			o, i, i, i, i, o, o, i,
			2,
			i, i, o, i, i, o, o, i),
		\+ shift(lsr,
			3, o, e, 1, 8, o, i, 0,
			0,
			3, o, e, 1, 8, o, i, 0).
	test(lsl) :-
		shift(lsl,
			i, i, i, o, o, i, o, i,
			3,
			o, o, i, o, i, o, o, o),
		\+ shift(lsr,
			i, o, o, i, o, o, i, i,
			4,
			i, o, o, i, o, o, o, i),
		\+ shift(lsr,
			3, 3, o, i, e, y, aa, i,
			i,
			o, o, i, i, i, o, e, c).
	test(asr) :-
		shift(asr,
			i, i, o, i, i, o, i, o,
			4,
			i, i, i, i, i, i, o, i),
		\+ shift(asr,
			o, i, i, o, i, i, i, o,
			0,
			i, o, o, i, i, o, i, i),
		\+ shift(asr,
			i, i, y, c, 8, o, 9, c,
			1,
			i, i, i, y, c, 8, o, 9).
	test(asl) :-
		shift(asl,
			i, o, o, i, i, o, o, o,
			3,
			i, i, o, o, o, o, o, o),
		\+ shift(asl,
			i, o, o, i, i, i, o, i,
			5,
			i, o, i, i, o, o, i, o),
		\+ shift(asl,
			8, o, c, c, u, i, i, 4,
			5,
			o, i, i, o, c, i, f, e).

:- end_tests(shift).

:- begin_tests(adder).

	test(adder) :-
		adder(o, o, o, o, o),
		adder(o, o, i, i, o),
		adder(o, i, o, i, o),
		adder(i, o, o, i, o),
		adder(i, i, o, o, i),
		adder(i, o, i, o, i),
		adder(o, i, i, o, i),
		adder(i, i, i, i, i),
		\+ adder(i, o, i, o, o),
		\+ adder(o, 0, e, o, i).

:- end_tests(adder).

:- begin_tests(comparators).

	test(i) :-
		comparator(1, 2),
		comparator(0, f),
		\+ comparator(f, 8),
		\+ comparator(g, 55).
	test(byte) :-
		comparator_byte(eq,
			3, a,
			3, a),
		\+ comparator_byte(eq,
			4, c,
			0, c),
		\+ comparator_byte(eq,
			r, f,
			r, f),
		comparator_byte(ne,
			4, b,
			c, e),
		\+ comparator_byte(ne,
			c, 3,
			c, 3),
		\+ comparator_byte(ne,
			j, y,
			e, f),
		comparator_byte(lt,
			4, 5,
			9, e),
		\+ comparator_byte(lt,
			5, 0,
			0, e),
		\+ comparator_byte(lt,
			9, 55,
			f, l),
		comparator_byte(le,
			3, 9,
			5, a),
		comparator_byte(le,
			6, 4,
			6, 4),
		\+ comparator_byte(le,
			f, 3,
			l, l),
		comparator_byte(gt,
			9, 5,
			9, 0),
		\+ comparator_byte(gt,
			4, c,
			9, f),
		\+ comparator_byte(gt,
			99, b,
			_, i),
		comparator_byte(ge,
			a, 9,
			3, 0),
		comparator_byte(ge,
			a, 4,
			a, 4),
		\+ comparator_byte(ge,
			5, c,
			a, a),
		\+ comparator_byte(ge,
			77, l,
			z, i).
	test(short) :-
		comparator_short(eq,
			3, a, e, 0,
			3, a, e, 0),
		\+ comparator_short(eq,
			4, c, 3, 5,
			0, c, 0, c),
		\+ comparator_short(eq,
			r, f, e, 3,
			r, f, e, 3),
		comparator_short(ne,
			4, b, c, e,
			3, 9, d, c),
		\+ comparator_short(ne,
			c, 3, 5, 4,
			c, 3, 5, 4),
		\+ comparator_short(ne,
			j, y, e, f,
			c, 3, 4, a),
		comparator_short(lt,
			4, 5, 4, a,
			9, e, 9, 4),
		\+ comparator_short(lt,
			5, 0, 5, b,
			0, e, 5, 5),
		\+ comparator_short(lt,
			9, 55, b, i,
			l, z, f, l),
		comparator_short(le,
			3, 9, e, 5,
			5, a, b, 5),
		comparator_short(le,
			6, 4, d, e,
			6, 4, d, e),
		\+ comparator_short(le,
			f, 3, 9, 8,
			l, l, 59, 30),
		comparator_short(gt,
			9, 5, 6, 4,
			9, 0, a, b),
		\+ comparator_short(gt,
			4, c, 5, 0,
			6, f, c, c),
		\+ comparator_short(gt,
			99, b, _, i,
			o, 5, 3, 2),
		comparator_short(ge,
			a, 9, 3, 7,
			3, 0, 3, 0),
		comparator_short(ge,
			a, 4, 6, 7,
			a, 4, 6, 7),
		\+ comparator_short(ge,
			5, c, 3, 4,
			a, a, 7, 5),
		\+ comparator_short(ge,
			77, l, z, i,
			o, t, v, z).
	test(int) :-
		comparator_int(eq,
			3, a, e, 0, 4, 8, f, d,
			3, a, e, 0, 4, 8, f, d),
		\+ comparator_int(eq,
			4, c, 3, 5, 0, c, 0, c,
			9, 7, c, 4, a, 4, 5, 4),
		\+ comparator_int(eq,
			r, f, e, 3, 4, c, a, 3,
			r, f, e, 3, 4, c, a, 3),
		comparator_int(ne,
			4, b, c, e, e, 3, 9, d,
			c, 8, 4, c, b, 4, 2, 6),
		\+ comparator_int(ne,
			c, 3, 5, 4, 7, 7, 5, 3,
			c, 3, 5, 4, 7, 7, 5, 3),
		\+ comparator_int(ne,
			j, y, e, f, c, 3, 4, a,
			9, 0, 0, 3, b, a, f, 4),
		comparator_int(lt,
			4, 5, 4, a, 3, 3, 8, 7,
			9, e, 9, 4, f, f, 0, 0),
		\+ comparator_int(lt,
			5, 0, 5, b, 1, 1, 6, 3,
			0, e, 5, 5, 8, 0, 6, e),
		\+ comparator_int(lt,
			9, 55, b, i, l, z, f, l,
			h, f, v, 5, 32, c, 4, 00),
		comparator_int(le,
			3, 9, e, 5, 8, 0, 8, 9,
			5, a, b, 5, 3, 2, e, e),
		comparator_int(le,
			6, 4, d, e, 3, 4, 8, b,
			6, 4, d, e, 3, 4, 8, b),
		\+ comparator_int(le,
			f, 3, 9, 8, l, l, 59, 30,
			d, x, w, w, i, l, b, 10),
		comparator_int(gt,
			9, 5, 6, 4, 5, b, 9, 3,
			9, 0, a, b, b, 4, 8, 9),
		\+ comparator_int(gt,
			4, c, 5, 0, 3, 3, 0, 9,
			6, f, c, c, b, 4, 1, 0),
		\+ comparator_int(gt,
			99, b, _, i, o, 5, 3, 2,
			h, h, b, b, 4, 2, 8, v),
		comparator_int(ge,
			a, 9, 3, 7, 8, 7, 7, 0,
			3, 0, 3, 0, f, e, a, b),
		comparator_int(ge,
			a, 4, 6, 7, 6, 8, 2, a,
			a, 4, 6, 7, 6, 8, 2, a),
		\+ comparator_int(ge,
			5, c, 3, 4, 2, 0, b, f,
			a, a, 7, 5, f, 4, 8, c),
		\+ comparator_int(ge,
			77, l, z, i, o, t, v, z,
			8, a, cm, nn, _, 3, a, c).

:- end_tests(comparators).

:- begin_tests(plus).

	test(binary_byte) :-
		plus_(
			i, o, o, i, i, o, i, i,
			o, i, o, o, i, i, o, i,
			o,
			i, i, i, o, i, o, o, o,
			o,
			o),
		plus_(
			i, i, o, o, i, o, o, o,
			i, i, o, o, o, i, i, o,
			o,
			i, o, o, o, i, i, i, o,
			i,
			o),
		plus_(
			o, i, o, i, i, o, i, o,
			o, i, o, o, i, i, o, i,
			i,
			i, o, i, o, i, o, o, o,
			o,
			i),
		plus_(
			i, i, o, o, i, o, i, o,
			i, o, i, o, o, i, o, o,
			i,
			o, i, i, o, i, i, i, i,
			i,
			i),
		\+ plus_(
			i, i, o, i, o, i, i, o,
			i, i, o, i, i, o, i, 0,
			o,
			i, i, i, i, o, o, o, o,
			i,
			o).
	test(byte) :-
		plus_byte(
			5, 3,
			2, 2,
			7, 5,
			o),
		plus_byte(
			c, 9,
			c, 6,
			8, f,
			o),
		plus_byte(
			7, 9,
			4, a,
			c, 3,
			i),
		plus_byte(
			c, a,
			b, 4,
			7, e,
			i),
		\+ plus_byte(
			j, 4,
			i, 0,
			f, 4,
			o).
	test(short) :-
		plus_short(
			5, 3, 3, a,
			2, 2, 8, 2,
			7, 5, b, c,
			o),
		plus_short(
			c, 9, 5, 4,
			c, 6, 5, b,
			8, f, a, f,
			o),
		plus_short(
			7, 9, 4, c,
			4, a, 4, d,
			c, 3, 9, 9,
			i),
		plus_short(
			c, a, 7, 7,
			b, 4, a, 2,
			7, f, 1, 9,
			i),
		\+ plus_short(
			j, 4, 5, 7,
			i, 0, 8, b,
			f, 4, e, 2,
			o).
	test(int) :-
		plus_int(
			5, 3, 3, a, 8, 5, c, d,
			2, 2, 8, 2, 1, 3, 9, 0,
			7, 5, b, c, 9, 9, 5, d,
			o),
		plus_int(
			c, 9, 5, 4, 3, 2, a, f,
			c, 6, 5, b, 3, 0, e, c,
			8, f, a, f, 6, 3, 9, b,
			o),
		plus_int(
			7, 9, 4, c, 3, 2, 2, b,
			4, a, 4, d, 4, 9, d, 1,
			c, 3, 9, 9, 7, b, f, c,
			i),
		plus_int(
			c, a, 7, 7, 5, 8, 8, b,
			b, 4, a, 2, f, 5, 3, 2,
			7, f, 1, a, 4, d, b, d,
			i),
		\+ plus_int(
			j, 4, 5, 7, 2, c, d, e,
			i, 0, 8, b, l, j, _, 5,
			f, 4, e, 2, 3, 2, n, nn,
			o).

:- end_tests(plus).

:- begin_tests(minus).

	test(byte) :-
		minus_byte(
			7, 5,
			2, 2,
			5, 3,
			o),
		minus_byte(
			8, f,
			c, 6,
			c, 9,
			o),
		minus_byte(
			c, 3,
			4, a,
			7, 9,
			i),
		minus_byte(
			7, e,
			b, 4,
			c, a,
			i),
		\+ minus_byte(
			f, 4,
			i, 0,
			j, 4,
			o).
	test(short) :-
		minus_short(
			7, 5, b, c,
			2, 2, 8, 2,
			5, 3, 3, a,
			o),
		minus_short(
			8, f, a, f,
			c, 6, 5, b,
			c, 9, 5, 4,
			o),
		minus_short(
			c, 3, 9, 9,
			4, a, 4, d,
			7, 9, 4, c,
			i),
		minus_short(
			7, f, 1, 9,
			b, 4, a, 2,
			c, a, 7, 7,
			i),
		\+ minus_short(
			f, 4, e, 2,
			i, 0, 8, b,
			j, 4, 5, 7,
			o).
	test(int) :-
		minus_int(
			7, 5, b, c, 9, 9, 5, d,
			2, 2, 8, 2, 1, 3, 9, 0,
			5, 3, 3, a, 8, 5, c, d,
			o),
		minus_int(
			8, f, a, f, 6, 3, 9, b,
			c, 6, 5, b, 3, 0, e, c,
			c, 9, 5, 4, 3, 2, a, f,
			o),
		minus_int(
			c, 3, 9, 9, 7, b, f, c,
			4, a, 4, d, 4, 9, d, 1,
			7, 9, 4, c, 3, 2, 2, b,
			i),
		minus_int(
			7, f, 1, a, 4, d, b, d,
			b, 4, a, 2, f, 5, 3, 2,
			c, a, 7, 7, 5, 8, 8, b,
			i),
		\+ minus_int(
			f, 4, e, 2, 3, 2, n, nn,
			i, 0, 8, b, l, j, _, 5,
			j, 4, 5, 7, 2, c, d, e,
			o).

:- end_tests(minus).

:- run_tests.
:- halt.

