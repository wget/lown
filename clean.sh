#!/usr/bin/env bash


while [ 1 ]; do
    read -p "[?] This script will remove all non .tex, .wiki or .pdf files. Do you want to continue? [y/N] " answer
    case $answer in
        [Yy]*)

            # Need to enbale extglob as the remove command we use needs this feature.
            shopt extglob
            extglobStatus=$(shopt extglob)
            extglobStatus=${extglobStatus##extglob }
            if [ "$extglobStatus" == "off" ]; then
                echo "[+] extglob (Extended Pattern Matching) is disabled in Bash, enabling it..."
                shopt -s extglob
            fi
            shopt extglob

            echo "[+] Removing..."
            rm !(*.tex|*.wiki|*.pdf)

            break;;
        [Nn]*|"")
            break;;
        *)
            echo "[${RED}-${OFF}] Please answer by y or n.";;
    esac
done
echo "[+] Exiting..."
