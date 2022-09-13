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
echo BashyTuber GENERATOR ONLY by Marco Casanova
echo for the complete one, visit my repo https://github.com/MarcoCasanova00/bashytube


# prompt for youtube link and use youtube-dl to download related mp3 file to present directory
UYEL='\033[4;33m'
NC='\033[0m'


echo -e "${UYEL}Choose the directory you want me to choose the random jpg from:${NC}"
ls
read VARDIRIMG
echo -e "${UYEL}Ok. I will take one image from $VARDIR for this video. \n"

echo -e "${UYEL}Now please point me to the directory your mp3's are located:${NC}"
ls
read VARDIRAUD

echo -e "${UYEL}Enter the full name of the mp3 you wish to use from $VARDIRAUD: (Output will be empty if mp3 absent from directory.)${NC}"
ls -1 $VARDIRAUD/*.mp3
read MP3

sleep 1
echo -e "${UYEL}Reading file ... \n${NC}"

# for the video :

IMG="$(ls -1 $VARDIRIMG/*.jpg | shuf -n 1)"

ffmpeg -r 1 -loop 1 -i $IMG -i $MP3 -acodec copy -r 1 -shortest -vf scale=1280:720 ep1.flv 


sleep 1
echo -e "${UYEL}Probably done. goodbye!${NC}"


