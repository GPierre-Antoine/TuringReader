
.PHONY: debug
debug:bin build/lex.yy.c build/turing.tab.c build/turing.tab.h
	g++ -o bin/turing build/turing.tab.c build/lex.yy.c -lfl -DYYDEBUG=1

bin/turing: lex.yy.c turing.tab.c turing.tab.h
	mkdir -p bin && g++ -o $@ turing.tab.c build/lex.yy.c -lfl

build/turing.tab.c: build turing.y
	bison -o $@ -d turing.y

build/turing.tab.h: build turing.y
	bison -o $@ -td turing.y

build/lex.yy.c: build turing.l
	flex -o $@ turing.l

build:
	mkdir build

bin:
	mkdir bin

.PHONY: clean
clean:
	gitRemove -f

.PHONY: inter
inter: debug
	bin/turing < tests/inter.json

.PHONY: AABB
AABB: debug
	bin/turing < tests/AABB.json

