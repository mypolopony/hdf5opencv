CXX = g++
CXXFLAGS=-DNDEBUG -O2 -Wall

LIBS=-lhdf5_hl \
     -lhdf5 \
     -lpthread \
     -lboost_filesystem-mt \
     -lboost_system-mt

LIBS:=$(LIBS) `pkg-config opencv --libs` 
CXXFLAGS:=$(CXXFLAGS) `pkg-config opencv --cflags`

.PHONY: all
all: demo

demo: demo.o hdf5opencv.o
	$(CXX) $^ $(CXXFLAGS) $(LIBS) -o $@

demo.o: demo.cc
	$(CXX) $(CXXFLAGS) -c $< 

hdf5opencv.o: hdf5opencv.cc
	$(CXX) $(CXXFLAGS) -c $< 

clean:
	rm -f *.o demo
