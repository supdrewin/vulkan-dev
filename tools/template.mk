# template.mk - supdrewin

CXXFLAGS   += -pedantic -std=c++2a
CXXFLAGS   += -I${workspaceFolder}/include
LDFLAGS    += -L${workspaceFolder}/lib
LDFLAGS    += -flto -pie
LDLIBS     += -ldl -lglfw3 -lpthread
LDLIBS     += -lvulkan

output_dir := $(workspaceFolder)/bin

$(output_dir)/$(PROJECT): *.cpp; mkdir -p $(output_dir)
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@
.PHONY: $(output_dir)/$(PROJECT)
