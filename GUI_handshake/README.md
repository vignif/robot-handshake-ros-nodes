HOW TO RUN THE HANDSHAKE GUI
open a terminal.
cd the current folder.
type 'gcc -o Handshake handshake_demos.c $(pkg-config --cflags --libs gtk+-3.0 gmodule-2.0)'

now you have an executable in the folder, named 'handshake'

to run it, type in the terminal './handshake'
