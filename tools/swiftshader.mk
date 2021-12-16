# swiftshader.mk - supdrewin

swiftshader_src   = $(submodule_dir)/swiftshader
swiftshader_build = $(swiftshader_src)/build

prepare/swiftshader: check/cmake
	$(CMAKE_COMMAND) \
		--install-prefix $(workspaceFolder) \
		-B $(swiftshader_build) \
		-D BUILD_VULKAN_WRAPPER=TRUE \
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
	$(CMAKE_COMMAND) --install $(swiftshader_build)
	install -Dm644 -t $(workspaceFolder)/include/vulkan $(swiftshader_src)/include/vulkan/*.h
	install -Dm644 -t $(workspaceFolder)/include/vulkan $(swiftshader_src)/include/vulkan/*.hpp
	install -Dm644 -t $(workspaceFolder)/lib $(swiftshader_build)/Linux/libvk_swiftshader.so
	install -Dm644 -t $(workspaceFolder)/lib $(swiftshader_build)/Linux/vk_swiftshader_icd.json
	$(RM) $(workspaceFolder)/include/vulkan/vk_google_filtering_precision.h
.PHONY: install/swiftshader

uninstall/swiftshader:
	$(RM) -r $(workspaceFolder)/include/vulkan
	$(RM) $(workspaceFolder)/lib/libvk_swiftshader.so
	$(RM) $(workspaceFolder)/lib/vk_swiftshader_icd.json
.PHONY: uninstall/swiftshader

clean/swiftshader: check/cmake
	$(CMAKE_COMMAND) \
		--build $(swiftshader_build) \
		--target clean
.PHONY: clean/swiftshader
