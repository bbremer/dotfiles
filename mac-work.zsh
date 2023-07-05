if [[ $# -gt 0 ]]
then
    TIME=$1
else
    TIME=25m
fi

echo $TIME

timer $TIME && terminal-notifier -message 'Pomodoro'\
    -title 'Work Timer is up! Take a Break 😊'\
    -sound Crystal
