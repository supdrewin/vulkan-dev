# template.mk - supdrewin

CXXFLAGS += -std=c++2a -I${workspaceFolder}/include -pedantic
LDFLAGS  += -L${workspaceFolder}/lib -Wl,-rpath,.,-rpath,lib
LDLIBS   += -lglfw3 -lpthread -ldl -lvk_swiftshader

output_dir := $(workspaceFolder)/bin

$(output_dir)/$(PROJECT): *.cpp; mkdir -p $(output_dir)
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@
.PHONY: $(output_dir)/$(PROJECT)
