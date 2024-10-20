if [ -n $OPENBSD ]
	function ban --description 'Ban an IP address in `pf\''
		pfctl -t bannedbots -T add $argv
		printf '%s\n' $argv >> /etc/banned_bots
	end
end
