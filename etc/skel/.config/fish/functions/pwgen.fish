function pwgen --description 'Generate a password'
	if contains -- --help $argv || contains -- -help $argv || contains -- -h $argv
		printf '%s\n'\
			'Usage: pwgen COUNT'\
			'Securely generate a random ascii password of COUNT length'
		return
	end
	if not count $argv >/dev/null 2>&1
		return 1
	end
	for i in (seq $argv[1])
		set hex[$i] (printf '%x' (math 0x(head -c1 /dev/urandom | xxd -ps) % 94 + 0x21) | xxd -ps -r)
	end
	printf '%s\n' (printf '%s\n' $hex | string join '')
end
