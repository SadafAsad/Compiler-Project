test: all clean
	./a.out < input.c > output.c

all: flex bison parser.tab.h
	gcc myscanner.tab.c lex.yy.c -w

flex: lexer.l
	flex -i myscanner.l

bison: parser.y
	bison -v -d myscanner.y

clean:
	rm lex.yy.c myscanner.tab.c myscanner.tab.h myscanner.output