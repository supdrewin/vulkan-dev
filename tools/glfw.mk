# glfw.mk - supdrewin

glfw_src   = $(submodule_dir)/glfw
glfw_build = $(build_dir)/glfw

prepare/glfw: check/cmake
	$(CMAKE_COMMAND) \
		--install-prefix $(workspaceFolder) \
		-B $(glfw_build) \
		-D CMAKE_BUILD_TYPE=Release \
		-D GLFW_USE_HYBRID_HPG=ON \
		-S $(glfw_src)
.PHONY: prepare/glfw

build/glfw: prepare/glfw
	$(CMAKE_COMMAND) \
		--build $(glfw_build) \
		--parallel $(JOBS)
.PHONY: build/glfw

install/glfw: build/glfw
	$(CMAKE_COMMAND) \
		--build $(glfw_build) \
		--target install
.PHONY: install/glfw

uninstall/glfw: check/cmake
	$(CMAKE_COMMAND) \
		--build $(glfw_build) \
		--target uninstall
.PHONY: uninstall/glfw

clean/glfw: check/cmake
	$(CMAKE_COMMAND) \
		--build $(glfw_build) \
		--target clean
.PHONY: clean/glfw
