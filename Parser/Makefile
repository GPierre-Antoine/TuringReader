
.PHONY: debug
debug:lex.yy.c turing.tab.c turing.tab.h
	mkdir -p bin && g++ -o bin/turing turing.tab.c lex.yy.c -lfl -DYYDEBUG=1

bin/turing: lex.yy.c turing.tab.c turing.tab.h
	mkdir -p bin && g++ -o $@ turing.tab.c lex.yy.c -lfl

turing.tab.c: turing.y
	bison -d turing.y

turing.tab.h: turing.y
	bison -td turing.y

lex.yy.c: turing.l
	flex turing.l

.PHONY: clean
clean:
	gitRemove -f

.PHONY: inter
inter: debug
	bin/turing < tests/inter.json

.PHONY: AABB
AABB: debug
	bin/turing < tests/AABB.json
