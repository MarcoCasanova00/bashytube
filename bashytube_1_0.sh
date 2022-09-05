#!/bin/bash
# requires ffmpeg, youtube-dl

echo "  ___            _           ";
echo " | _ ) __ _  ___| |_  _  _   ";
echo " | _ \/ _\` |(_-<| ' \| || |  ";
echo " |___/\__,_|/__/|_||_|\_, |  ";
echo "  _____       _       |__/   ";
echo " |_   _|_  _ | |__  ___  _ _ ";
echo "   | | | || || '_ \/ -_)| '_|";
echo "   |_|  \_,_||_.__/\___||_|  ";
echo "                             ";
echo BashyTuber 1.0 by Marco Casanova

# prompt for youtube link and use youtube-dl to download related mp3 file to present directory
UYEL='\033[4;33m'
NC='\033[0m'
echo -e  "${UYEL}Enter youtube URL to download the mp3 from:${NC}"
read varurl

sleep 1
echo -e "${UYEL}Downloading $varurl ... Please wait ...${NC}"
sleep 1
youtube-dl -x --audio-format mp3 -f bestaudio -o '%(view_count)s.%(ext)s' $varurl
sleep 1
echo -e "${UYEL}Probably done, go check the directory this script was run from.\n${NC}"


# takes random image from provided image_folder and fetches previously downloaded mp3 to combine it with image using ffmpeg
# check the extension and the dir


echo -e "${UYEL}Enter the full name of the mp3 you wish to use: (Output will be empty if mp3 absent from directory.)${NC}"
ls | grep ".mp3$"
read MP3

sleep 1
echo -e "${UYEL}Reading file ...${NC}"

# for the video :

IMG="$(ls -1 classical_paintings/*.jpg | shuf -n 1)"

ffmpeg -r 1 -loop 1 -i $IMG -i $MP3 -acodec copy -r 1 -shortest -vf scale=1280:720 ep1.flv 


sleep 1
echo -e "${UYEL}Probably done. goodbye!${NC}"


