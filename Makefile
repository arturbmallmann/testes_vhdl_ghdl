# ghdl-mcode -a padroes.vhd somador.vhd somador_loop.vhd test_bench.vhd
# ghdl-mcode -e test_bench_e
# ghdl-mcode -r test_bench_e --wave=onda.ghw --stop-time=100ns
# gtkwave onda.ghw
GHDL=ghdl-gcc
# GHDL=ghdl-mcode
# SYSTEM_C=/usr/local/systemc-2.3.1-inst/
SYSTEM_C=/usr/include/sysc
#INC_FLAGS=-I$(SYSTEM_C)/include
#LDFLAGS=$(SYSTEM_C)/lib/libsystemc.a
INC_FLAGS=
LDFLAGS=

UNIT=test_bench_e
WAVEF=onda.ghw
TIME=1000ns

CXX=g++
CFLAGS=-g

#OBJS=first_counter_tb.o
OBJS_DEPS=constantes.o somador.o somador_loop.o test_bench.o e~test_bench.o

all: $(OBJS_DEPS)
	$(GHDL) -r $(UNIT) --wave=$(WAVEF) --stop-time=$(TIME)

somador: $(OBJS) $(OBJS_DEPS)
	$(CXX) -o $@ $(CFLAGS) $(OBJS) $(LDFLAGS) `$(GHDL) --list-link counter` 

onda:
	gtkwave $(WAVEF)

#first_counter_tb.o: first_counter_tb.cpp first_counter.cpp counter_vhdl.cpp
#	$(CXX) -c -o $@ first_counter_tb.cpp $(CFLAGS) $(INC_FLAGS)

constantes.o: constantes.vhd
	$(GHDL) -a constantes.vhd

somador.o: somador.vhd
	$(GHDL) -a somador.vhd

somador_loop.o: somador_loop.vhd
	$(GHDL) -a somador_loop.vhd

test_bench.o: test_bench.vhd
	$(GHDL) -a test_bench.vhd

e~test_bench.o: test_bench.o
	$(GHDL) -e test_bench_e
# $(GHDL) --bind test_bench_e

clean:
	$(RM) *.o first_counter_tb
