# swiftshader.mk

swiftshader_src   = third_party/swiftshader
swiftshader_build = third_party/swiftshader/build
swiftshader_mark  = swiftshader.done

build/swiftshader: check/cmake
	tools/no_warning_to_error.sh $(swiftshader_src) $(swiftshader_mark) &
	$(CMAKE_COMMAND) -S $(swiftshader_src) -B $(swiftshader_build)
	$(CMAKE_COMMAND) --build $(swiftshader_build) -j $(JOBS)
	touch $(swiftshader_mark)
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
.PHONY: clean/swiftshader
