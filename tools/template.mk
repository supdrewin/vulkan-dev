# template.mk - supdrewin

CXXFLAGS += -std=c++2a -I${workspaceFolder}/include -pedantic
LDFLAGS  += -L${workspaceFolder}/lib -Wl,-rpath,.
LDLIBS   += -lglfw3 -lvk_swiftshader

output_dir := $(workspaceFolder)/bin

$(output_dir)/$(PROJECT): *.cpp; mkdir -p $(output_dir)
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@
.PHONY: $(output_dir)/$(PROJECT)
