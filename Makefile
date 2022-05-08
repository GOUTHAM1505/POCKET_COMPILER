run: lex yacc gcc out p1 all

all: gen.py optimized_icg.txt
	python3 gen.py optimized_icg.txt
p1: icg_opt.py 
	python3 icg_opt.py icg.txt
out: sample.cpp
	./a.out < sample.cpp
gcc: lex.yy.c y.tab.c
	gcc lex.yy.c y.tab.c
yacc: icg.y
	yacc -d icg.y 
lex: icg.l
	lex icg.l
