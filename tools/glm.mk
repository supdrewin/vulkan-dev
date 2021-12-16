# glm.mk - supdrewin

glm_src   = $(submodule_dir)/glm
glm_build = $(build_dir)/glm

prepare/glm: check/cmake
	$(CMAKE_COMMAND) \
		--install-prefix $(workspaceFolder) \
		-B $(glm_build) \
		-D BUILD_TESTING=OFF \
		-S $(glm_src)
.PHONY: prepare/glm

build/glm: prepare/glm
.PHONY: build/glm

install/glm: build/glm
	$(CMAKE_COMMAND) \
		--build $(glm_build) \
		--target install
.PHONY: install/glm

uninstall/glm: check/cmake
	$(CMAKE_COMMAND) \
		--build $(glm_build) \
		--target uninstall
.PHONY: uninstall/glm

clean/glm: check/cmake
	$(CMAKE_COMMAND) \
		--build $(glm_build) \
		--target clean
.PHONY: clean/glm
