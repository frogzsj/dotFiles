time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
# if command -v tmux>/dev/null; then
# 	[ -z $TMUX ] && exec tmux
# else
# 	echo "tmux not installed. Run ./deploy to configure dependencies"
# fi

echo "Updating configuration"
(cd $HOME/dotFiles && git pull && git submodule update --init --recursive)
source $HOME/dotFiles/zsh/zshrc.sh
