set_project("fast_io_relates")
set_version("0.1.0")

add_rules("mode.debug", "mode.release")

set_languages("c++26")

add_includedirs("fast_io/include")

option("san")
	set_default(false)
	set_showmenu(true)
	set_description("Enable ASan+UBSan (Clang/GCC)")
option_end()

if has_config("san") then
	add_cxxflags("-fsanitize=address,undefined", "-fno-omit-frame-pointer", {force = true})
	add_ldflags("-fsanitize=address,undefined", {force = true})
end

if is_plat("windows") then
	add_defines("_CRT_SECURE_NO_WARNINGS", "_CRT_NONSTDC_NO_DEPRECATE")
	add_syslinks("ntdll", "psapi")
end

includes("benchmark")
includes("test")
