set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set incsearch
set textwidth=70
set autoread
set number
syntax on

" Vundle Configuration Starts
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
