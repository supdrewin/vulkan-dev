# vulkan_loader.mk - supdrewin

vulkan_loader_src   = $(submodule_dir)/Vulkan-Loader
vulkan_loader_build = $(build_dir)/Vulkan-Loader

prepare/Vulkan-Loader: check/cmake
	$(CMAKE_COMMAND) \
		--install-prefix $(workspaceFolder) \
		-B $(vulkan_loader_build) \
		-D CMAKE_BUILD_TYPE=Release \
		-D VULKAN_HEADERS_INSTALL_DIR=$(workspaceFolder) \
		-S $(vulkan_loader_src)
.PHONY: prepare/Vulkan-Loader

build/Vulkan-Loader: prepare/Vulkan-Loader
	$(CMAKE_COMMAND) \
		--build $(vulkan_loader_build) \
		--parallel $(JOBS)
.PHONY: build/Vulkan-Loader

install/Vulkan-Loader: build/Vulkan-Loader
	$(CMAKE_COMMAND) \
		--build $(vulkan_loader_build) \
		--target install
.PHONY: install/Vulkan-Loader

uninstall/Vulkan-Loader: check/cmake
	$(CMAKE_COMMAND) \
		--build $(vulkan_loader_build) \
		--target uninstall
.PHONY: uninstall/Vulkan-Loader

clean/Vulkan-Loader: check/cmake
	$(CMAKE_COMMAND) \
		--build $(vulkan_loader_build) \
		--target clean
.PHONY: clean/Vulkan-Loader
