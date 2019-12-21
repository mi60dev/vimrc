cd /

mkdir git

mkdir /git/dotfiles

cd /git/dotfiles/

git clone git@github.com:mihailvalchev/ubuntu-terminal-configs.git

ln -s /git/dotfiles/ubuntu-terminal-configs/.vimrc /root/.vimrc


Install pathogen

mkdir -p ~/.vim/autoload ~/.vim/bundle && \

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


Dl emmet

git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim


vim /root/.vimrc

comment out emmet-vim

Installation NERDTree

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
...


to be continued
