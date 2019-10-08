turing: lex.yy.c turing.tab.c turing.tab.h
	 g++ -o $@ turing.tab.c lex.yy.c -lfl -lm

turing.tab.c: turing.y
	bison -d turing.y

turing.tab.h: turing.y
	bison -d turing.y

lex.yy.c: turing.l
	flex turing.l
