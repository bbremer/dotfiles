if [[ $# -gt 0 ]]
then
    TIME=$1
else
    TIME=5m
fi

timer $TIME && terminal-notifier -message 'Pomodoro'\
    -title 'Break is over! Get back to work 😬'\
    -sound Crystal
