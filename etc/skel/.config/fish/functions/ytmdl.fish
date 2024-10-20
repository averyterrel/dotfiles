function ytmdl --description 'ytmdl wrapper to download song to the current directory if child of music directory'
	if contains -- music (pwd | tr [:upper:] [:lower:] | string split '/')
		set arg -o .
	end
	command ytmdl $arg $argv
end
