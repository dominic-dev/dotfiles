#!/bin/bash

FILES=(~/.config/nvim/ginit.vim ~/.config/nvim/init.vim ~/.tmux.conf ~/.vimrc)
DIR=~/git/backup/dotfiles/
TOTAL=${#FILES[@]}
BAR=50

function print_bar {
    # fillers
	let "n_signs=$1*$BAR/$TOTAL"
	result=""
    j=0
    for j in `seq 1 $n_signs`; do
        result="$result#"
        let j=j+1
    done

    # spaces
    let "spaces=$BAR-$n_signs"
    j=0
    for j in `seq 1 $spaces`; do
        result="$result."
    done

    # percentage
    let "percentage=$1*100/$TOTAL"

    # print
    echo -ne "$result $percentage%   $(basename $2)\r"
    sleep 1
}

function copy_file {
    cp "$1" "$DIR"
}


echo "Copying files"

let i=0
for file in ${FILES[@]}; do
    let i=$i+1
    print_bar $i $file
    copy_file $file
done

echo -ne '\n'
echo "Done"
