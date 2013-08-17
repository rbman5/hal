#!/bin/bash

mv ~/.bashrc ~/.bashrc.bak -f
mv ~/.dir_colors ~/.dir_colors.bak -f 
mv ~/bin ~/bin.bak

ln -s hal/.bashrc ~/.bashrc
ln -s hal/.dir_colors ~/.dir_colors
ln -s hal/bin ~/bin
