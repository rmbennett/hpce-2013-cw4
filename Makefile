# Makefile for posix and gcc
#g++ test_opencl.cpp -I ../include -lOpenCL -std=c++11
# Note on old compilers  *cough*  DoC  *cough* you might need -std=c++0x instead
CPPFLAGS=-I include -Wall -std=c++11
# Turn on optimisations
CPPFLAGS += -O2
LDLIBS = -lOpenCL
EXECUTABLES= src/make_world src/rmb209/step_world_v1_lambda src/render_world src/step_world src/rmb209/step_world_v2_function src/rmb209/step_world_v3_opencl src/rmb209/step_world_v4_double_buffered src/rmb209/step_world_v5_packed_properties

all: $(EXECUTABLES)

heat.o: include/heat.hpp
src/make_world: src/heat.o
src/step_world: src/heat.o
src/render_world: src/heat.o
src/rmb209/step_world_v1_lambda: src/heat.o
src/rmb209/step_world_v2_function: src/heat.o
src/rmb209/step_world_v3_opencl: src/heat.o
src/rmb209/step_world_v4_double_buffered: src/heat.o
src/rmb209/step_world_v5_packed_properties: src/heat.o

clean:
	rm -rf src/*.o


