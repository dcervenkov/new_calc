TARGET := calc

CXX_FILES := $(wildcard src/*.cc)
OBJ_FILES := $(addprefix obj/,$(notdir $(CXX_FILES:.cc=.o)))
DEP_FILES := $(OBJ_FILES:.o=.d)

TEST_CXX_FILES := $(wildcard src/tests/*.cc)

CXX := g++
CXX_FLAGS := -std=c++11 -g -Wall
INCS := -Isrc

.PHONY: all clean

all:: $(TARGET)

-include $(DEP_FILES)

$(TARGET): $(OBJ_FILES)
	$(CXX) -o $@ $^ 

obj/%.o: src/%.cc | obj
	$(CXX) $(CXX_FLAGS) $(INCS) -c -MMD -o $@ $<

obj:
	mkdir obj

tests: $(TARGET) $(TEST_CXX_FILES)
	$(CXX) $(CXX_FLAGS) $(INCS) -o tests $(TEST_CXX_FILES) $(filter-out obj/calc.o, $(OBJ_FILES))

tidy: $(CXX_FILES)
	clang-tidy $^ -- $(CXX_FLAGS) $(INCS)

clean::
	rm -f $(OBJ_FILES) $(DEP_FILES) $(TARGET) tests

