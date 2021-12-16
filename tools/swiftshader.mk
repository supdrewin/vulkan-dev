# swiftshader.mk - supdrewin

swiftshader_src   = $(workspaceFolder)/third_party/swiftshader
swiftshader_build = $(swiftshader_src)/build

build/swiftshader: check/cmake
	$(CMAKE_COMMAND) \
		-B $(swiftshader_build) \
		-D REACTOR_BACKEND=Subzero \
		-D SWIFTSHADER_BUILD_TESTS=FALSE \
		-D SWIFTSHADER_WARNINGS_AS_ERRORS=FALSE \
		-S $(swiftshader_src)
	$(CMAKE_COMMAND) \
		--build $(swiftshader_build) \
		--parallel $(JOBS)
.PHONY: build/swiftshader

install/swiftshader:
	install -Dm644 -t $(workspaceFolder)/include/vulkan $(swiftshader_src)/include/vulkan/*.h
	install -Dm644 -t $(workspaceFolder)/include/vulkan $(swiftshader_src)/include/vulkan/*.hpp
	install -Dm644 -t $(workspaceFolder)/lib $(swiftshader_build)/libvk_swiftshader.so
.PHONY: install/swiftshader

uninstall/swiftshader:
	rm -rf $(workspaceFolder)/include/vulkan
	rm -f $(workspaceFolder)/lib/libvk_swiftshader.so
.PHONY: uninstall/swiftshader

clean/swiftshader:
	$(MAKE) -C $(swiftshader_build) clean
	rm -f $(swiftshader_mark)
.PHONY: clean/swiftshader
