local projectdir = os.projectdir()
local third_party = path.join(projectdir, "third_party")

-- fmt: use header-only mode to avoid building/linking the library
-- (make sure third_party/fmt is present)
target("benchmark.0019.formatting.format_vs_fmt")
	set_kind("binary")
	set_group("benchmark")
	add_files("0019.formatting/format_vs_fmt.cc")
	add_includedirs(path.join(third_party, "fmt", "include"))
	add_defines("FMT_HEADER_ONLY")

-- fast_float: headers only
target("benchmark.0022.from_chars.atoi_vs_from_chars")
	set_kind("binary")
	set_group("benchmark")
	add_files("0022.from_chars/atoi_vs_from_chars.cc")
	add_includedirs(path.join(third_party, "fast_float", "include"))

-- dragonbox_to_chars is NOT header-only: it needs dragonbox_to_chars.cpp
-- teju_jagua is vendored and includes its own headers; this benchmark uses
-- dragonbox::to_chars and teju's headers for comparison.
target("benchmark.0020.teju_vs_dragonbox.teju_vs_dragonbox")
	set_kind("binary")
	set_group("benchmark")
	add_files("0020.teju_vs_dragonbox/teju_vs_dragonbox.cc")
	add_includedirs(path.join(third_party, "dragonbox", "include"))
	add_files(path.join(third_party, "dragonbox", "source", "dragonbox_to_chars.cpp"))
	add_includedirs(path.join(third_party, "teju_jagua"))
	add_includedirs(path.join(third_party, "teju_jagua", "teju", "include"))
	add_includedirs(path.join(third_party, "teju_jagua", "cpp", "common", "include"))
	add_includedirs(path.join(third_party, "teju_jagua", "third-party", "dragonbox", "include"))
