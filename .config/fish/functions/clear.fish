function clear
	if [ "$TERM" = "xterm-kitty" ]
		printf '\033[2J\033[3J\033[1;1H'
	else
	command clear
	end
end
