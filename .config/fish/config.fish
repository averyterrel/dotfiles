if status is-interactive
    # Commands to run in interactive sessions can go here
    keychain --agents gpg,ssh --eval $GPG_KEYS $SSH_KEYS | source && set -x GPG_TTY (tty)
end
