if status is-interactive
    # Commands to run in interactive sessions can go here

    # key manager
    command -q keychain && keychain --agents gpg,ssh --eval $GPG_KEYS $SSH_KEYS | source && set -x GPG_TTY (tty)
    # notifies on mail receipt
    command -q biff && biff y
end
