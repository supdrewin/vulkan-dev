# template.mk - supdrewin

.INCLUDE_DIRS += ${workspaceFolder}/include

CXXFLAGS 			+= -std=c++2a -pedantic
LDFLAGS  			+= -L${workspaceFolder}/lib -Wl,-rpath,lib
LDLIBS 				+= -lvk_swiftshader

$(workspaceFolder)/bin/$(PROJECT): *.cpp
	$(LINK.cpp) $^ $(LOADLIBES) $(LDLIBS) -o $@
.PHONY: $(workspaceFolder)/bin/$(PROJECT)
