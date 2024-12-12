ip() {
    echo "$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)"
}

# source $HOME/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
  iterm2_set_user_var ip $(ip)
}
# Get cheat sheet of command from cheat.sh. h <cmd>
h() {
  curl cheat.sh/${@:-cheat}
  # curl cheat.sh/$@
}

# https://superuser.com/questions/250227/how-do-i-see-what-my-most-used-linux-command-are
most() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

# Open docker shell for a container
ds() {
  container=$1
  shell=$2
  if [[ -z $shell ]]; then
    shell="/bin/bash"
  fi

  echo "[castle] Opening ${shell} for ${container}"

  docker exec -it "${container}" "${shell}"
}

# cf <file> - Copy content of file to clipboard
cf() {
  cat $1 | pbcopy
}

# compress <file/dir> - Compress <file/dir>.
compress() {
dirPriorToExe=`pwd`
dirName=`dirname $1`
baseName=`basename $1`

if [ -f $1 ] ; then
    echo "It was a file change directory to $dirName"
    cd $dirName
    case $2 in
    tar.bz2)
        tar cjf $baseName.tar.bz2 $baseName
        ;;
    tar.gz)
        tar czf $baseName.tar.gz $baseName
        ;;
    gz)
        gzip -9 $baseName
        ;;
    tar)
        tar -cvvf $baseName.tar $baseName
        ;;
    zip)
        zip -r $baseName.zip $baseName
        ;;
    *)
        echo "Method not passed compressing using tar.bz2"
        tar cjf $baseName.tar.bz2 $baseName
        ;;
    esac
    echo "Back to Directory $dirPriorToExe"
    cd $dirPriorToExe
else
    if [ -d $1 ] ; then
    echo "It was a Directory change directory to $dirName"
    cd $dirName
    case $2 in
        tar.bz2)
        tar cjf $baseName.tar.bz2 $baseName
        ;;
        tar.gz)
        tar czf $baseName.tar.gz $baseName
        ;;
        gz)
        gzip -r -9 $baseName
        ;;
        tar)
        tar -cvvf $baseName.tar $baseName
        ;;
        zip)
        zip -r $baseName.zip $baseName
        ;;
        *)
        echo "Method not passed compressing using tar.bz2"
        tar cjf $baseName.tar.bz2 $baseName
        ;;
    esac
    echo "Back to Directory $dirPriorToExe"
    cd $dirPriorToExe
    else
    echo "'$1' is not a valid file/folder"
    fi
fi
}

  # ram <process-name> - Find how much RAM a process is taking.
ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

rds_connections() {
  echo $(($1*1024*1024/12582880))
}
