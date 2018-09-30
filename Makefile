all: ex1.o psk31_dec.o

test: psk31_dec.o
	printf "03210010111311022130\n"  | ./psk31_dec.o # 0 errors
	printf "03200010111311022130\n"  | ./psk31_dec.o # 1 errors
	printf "03200010101311022130\n"  | ./psk31_dec.o # 2 errors non-adjacent
	printf "03201010101311022130\n"  | ./psk31_dec.o # 2 errors adjacent

%.o: %.c
	cc -o $@ $<

clean:
	rm *.o
	rm *.txt || true
