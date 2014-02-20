# Makefile for posix and gcc
#g++ test_opencl.cpp -I ../include -lOpenCL -std=c++11

# Note on old compilers  *cough*  DoC  *cough* you might need -std=c++0x instead
CPPFLAGS= -I include -Wall -std=c++11 -lOpenCL

EXECUTABLES= src/make_world src/render_world src/step_world 

all: $(EXECUTABLES)

src/make_world: src/heat.o
src/step_world: src/heat.o
src/render_world: src/heat.o

clean: 
	rm -rf src/*.o 
