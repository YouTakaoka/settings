run: a.out
	cat input.txt | ./exec.sh ./a.out

a.out: Main.cpp
	g++ -std=gnu++1y -O0 -I/opt/boost/gcc/include -L/opt/boost/gcc/lib -o a.out Main.cpp

clean:
	rm a.out

run2: a2.out
	./a2.out < input1.txt
	./a2.out < input2.txt
	./a2.out < input3.txt

a2.out: Main2.cpp
	g++ -std=gnu++1y -O0 -I/opt/boost/gcc/include -L/opt/boost/gcc/lib -o a2.out Main2.cpp

clean2:
	rm a2.out


