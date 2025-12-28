for _, file in ipairs(os.files("**/*.cc")) do
	local base = path.basename(file)
	target("test." .. base)
		set_kind("binary")
		set_group("test")
		add_files(file)
end
