# Swtich to colorls (https://github.com/athityakumar/colorls)
toggle_ls() {
  if [[ $(type ls) == "ls is an alias for colorls" ]]; then 
    alias ls="ls -G"
  else
    alias ls="colorls"
  fi
}

ip() {
    echo "$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)"
}

source $HOME/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
  iterm2_set_user_var ip $(ip)
}
# Get cheat sheet of command from cheat.sh. h <cmd>
h() {
  curl cheat.sh/${@:-cheat}
}

# cfile <file> - Copy content of file to clipboard
cfile() {
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
          gzip $baseName
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
          gzip -r $baseName
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
  echo "Done"
  echo "###########################################"
}
