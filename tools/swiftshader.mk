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
	install -Dm644 -t $(workspaceFolder)/lib $(swiftshader_build)/Linux/libvk_swiftshader.so
	install -Dm644 -t $(workspaceFolder)/lib $(swiftshader_build)/Linux/vk_swiftshader_icd.json
.PHONY: install/swiftshader

uninstall/swiftshader:
	$(RM) -r $(workspaceFolder)/include/glslang
	$(RM) -r $(workspaceFolder)/include/spirv-tools
	$(RM) -r $(workspaceFolder)/lib/cmake/SPIRV-Tools
	$(RM) -r $(workspaceFolder)/lib/cmake/SPIRV-Tools-link
	$(RM) -r $(workspaceFolder)/lib/cmake/SPIRV-Tools-lint
	$(RM) -r $(workspaceFolder)/lib/cmake/SPIRV-Tools-opt
	$(RM) -r $(workspaceFolder)/lib/cmake/SPIRV-Tools-reduce
	$(RM) -r $(workspaceFolder)/lib/cmake/glslang*
	$(RM) -r $(workspaceFolder)/lib/cmake/HLSL*
	$(RM) -r $(workspaceFolder)/lib/cmake/OGLCompiler*
	$(RM) -r $(workspaceFolder)/lib/cmake/OSDependent*
	$(RM) -r $(workspaceFolder)/lib/cmake/spirv-remap*
	$(RM) -r $(workspaceFolder)/lib/cmake/SPIRV*
	$(RM) -r $(workspaceFolder)/lib/cmake/SPVRemapper*
	$(RM) $(workspaceFolder)/lib/pkgconfig/SPIRV-Tools-shared.pc
	$(RM) $(workspaceFolder)/lib/pkgconfig/SPIRV-Tools.pc
	$(RM) $(workspaceFolder)/lib/libvk_swiftshader.so
	$(RM) $(workspaceFolder)/lib/vk_swiftshader_icd.json
	$(RM) $(workspaceFolder)/lib/libglslang.a
	$(RM) $(workspaceFolder)/lib/libHLSL.a
	$(RM) $(workspaceFolder)/lib/libOGLCompiler.a
	$(RM) $(workspaceFolder)/lib/libOSDependent.a
	$(RM) $(workspaceFolder)/lib/libSPIRV-Tools-link.a
	$(RM) $(workspaceFolder)/lib/libSPIRV-Tools-lint.a
	$(RM) $(workspaceFolder)/lib/libSPIRV-Tools-opt.a
	$(RM) $(workspaceFolder)/lib/libSPIRV-Tools-reduce.a
	$(RM) $(workspaceFolder)/lib/libSPIRV-Tools-shared.so
	$(RM) $(workspaceFolder)/lib/libSPIRV-Tools.a
	$(RM) $(workspaceFolder)/lib/libSPIRV.a
	$(RM) $(workspaceFolder)/lib/libSPVRemapper.a
	$(RM) $(workspaceFolder)/bin/glslangValidator
	$(RM) $(workspaceFolder)/bin/spirv-remap
.PHONY: uninstall/swiftshader

clean/swiftshader: check/cmake
	$(CMAKE_COMMAND) \
		--build $(swiftshader_build) \
		--target clean
.PHONY: clean/swiftshader
