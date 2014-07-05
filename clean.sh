#!/usr/bin/env bash

# Using shopt changes the way Bash parses the code. Placing this command
# further in the code (inside a case, condition, function,...) will trigger an
# error since the bang (!) used in the rm command will enable the Bash history
# feature: a bang expands the last command which begins with the text following
# the bang.
shopt -s extglob

while [ 1 ]; do
    read -p "[?] This script will remove all non .sh, .tex, .wiki or .pdf files. Do you want to continue? [y/N] " answer
    case $answer in
        [Yy]*)

            echo "[+] Removing..."
            rm !(*.sh|*.tex|*.wiki|*.pdf)

            break;;
        [Nn]*|"")
            break;;
        *)
            echo "[${RED}-${OFF}] Please answer by y or n.";;
    esac
done
echo "[+] Exiting..."
