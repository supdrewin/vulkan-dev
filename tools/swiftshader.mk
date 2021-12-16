# swiftshader.mk - supdrewin

swiftshader_src   = $(submodule_dir)/swiftshader
swiftshader_build = $(swiftshader_src)/build

prepare/swiftshader: check/cmake
	$(CMAKE_COMMAND) \
		-B $(swiftshader_build) \
		-D REACTOR_BACKEND=Subzero \
		-D SWIFTSHADER_BUILD_TESTS=FALSE \
		-D SWIFTSHADER_WARNINGS_AS_ERRORS=FALSE \
		-S $(swiftshader_src)
.PHONY: prepare/swiftshader

build/swiftshader: prepare/swiftshader
	$(CMAKE_COMMAND) \
		--build $(swiftshader_build) \
		--parallel $(JOBS)
.PHONY: build/swiftshader

install/swiftshader: build/swiftshader
	install -Dm644 -t $(workspaceFolder)/include/vulkan $(swiftshader_src)/include/vulkan/*.h
	install -Dm644 -t $(workspaceFolder)/include/vulkan $(swiftshader_src)/include/vulkan/*.hpp
	install -Dm644 -t $(workspaceFolder)/lib $(swiftshader_build)/libvk_swiftshader.so
	$(RM) $(workspaceFolder)/include/vulkan/vk_google_filtering_precision.h
.PHONY: install/swiftshader

uninstall/swiftshader:
	$(RM) -r $(workspaceFolder)/include/vulkan
	$(RM) $(workspaceFolder)/lib/libvk_swiftshader.so
.PHONY: uninstall/swiftshader

clean/swiftshader: check/cmake
	$(CMAKE_COMMAND) \
		--build $(swiftshader_build) \
		--target clean
	$(RM) $(swiftshader_mark)
.PHONY: clean/swiftshader
