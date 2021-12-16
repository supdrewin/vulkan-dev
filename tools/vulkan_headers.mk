# vulkan_headers.mk - supdrewin

vulkan_headers_src   = $(submodule_dir)/Vulkan-Headers
vulkan_headers_build = $(build_dir)/Vulkan-Headers

prepare/Vulkan-Headers: check/cmake
	$(CMAKE_COMMAND) \
		--install-prefix $(workspaceFolder) \
		-B $(vulkan_headers_build) \
		-S $(vulkan_headers_src)
.PHONY: prepare/Vulkan-Headers

build/Vulkan-Headers: prepare/Vulkan-Headers
.PHONY: build/Vulkan-Headers

install/Vulkan-Headers: build/Vulkan-Headers
	$(CMAKE_COMMAND) \
		--build $(vulkan_headers_build) \
		--target install
.PHONY: install/Vulkan-Headers

uninstall/Vulkan-Headers: check/cmake
	$(CMAKE_COMMAND) \
		--build $(vulkan_headers_build) \
		--target uninstall
.PHONY: uninstall/Vulkan-Headers

clean/Vulkan-Headers: check/cmake
	$(CMAKE_COMMAND) \
		--build $(vulkan_headers_build) \
		--target clean
.PHONY: clean/Vulkan-Headers
