#! /bin/bash

# Função para "vigiar" os arquivos Python dinamicamente

function watcher()
{
    BEG=$(date +%s.%N)    
    python3 $1
    FIN=$(date +%s.%N)
    ETA=$(echo $FIN - $BEG | bc);
    printf "\n\n\n"
    echo Seconds to finish: $ETA

}
export -f watcher

function pi_watch()
{
    watch --no-title -x bash -c "watcher $1"
}

function get_readme()
{
    DIR=$(tmux display-message -p -F "#{pane_current_path}" -t$1)
    tmux display -p -F "$DIR"
    TEXT=$(cat "$DIR/readme");
    tmux display -p -F "$TEXT" -t$1
}
export -f get_readme

# Parece que não posso colocar o watch para essas
# funções sem chamar o comando bash -c


function readme()
{
    watch --no-title -x bash -c "get_readme $1"
}


# Connection to tensorboard port 
alias tb2_clus='ssh -Y -f lshogun@146.164.45.180 -p  20022 -N -L '

#To pass arguments to gnuplot, MUST HAVE gnuConf
function plot(){ gnuplot -p -e "filename='$1'"  gnuConf;}; 
