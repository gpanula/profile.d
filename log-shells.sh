# generate log messages when shells are created and destroyed
# provides some extra logging for security purposes

# generate log message when a shell exits
# ref: https://superuser.com/questions/410525/explain-why-bash-logout-wont-run-commands
log_shell_ended () {
	echo "${USER} closed shell PID ${SHELL_PID}" | logger
}
trap log_shell_ended EXIT

# Test for an interactive shell.  
if [[ $- != *i* ]]
then
	# Shell is non-interactive.
	echo "${USER} created a new non-interactive shell PID $$" | logger
    export SHELL_PID=$$
else
    # Shell is interactive
    echo "${USER} created a new interactive shell PID $$" | logger
    export SHELL_PID=$$
fi
