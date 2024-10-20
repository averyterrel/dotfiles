function mkramfs --description 'make ramdisk'
	if contains -- --help $argv || contains -- -help $argv || contains -- -h $argv
		printf '%s\n'\
			'Usage: mkramfs SIZE PATH'\
			'Make a ramdisk of size SIZE at path PATH'
		return
	end
	mount -t tmpfs -o size="$argv[1]" tmpfs "$argv[2]"
end
