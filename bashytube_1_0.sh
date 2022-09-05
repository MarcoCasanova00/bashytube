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

# prompt for youtube link and use youtube-dl to download related mp3 file to present directory

echo please, enter youtube URL to download the mp3 from: 
read varurl

sleep 1
echo downloading $varurl ... please wait ...
sleep 1
youtube-dl -x --audio-format mp3 -f bestaudio -o '%(view_count)s.%(ext)s' $varurl
sleep 1
echo probably done, go check the directory this script was run from.


# takes random image from provided image_folder and fetches previously downloaded mp3 to combine it with image using ffmpeg
# check the extension and the dir


echo now please enter the full name of the mp3 you wish to use: 
ls | grep ".mp3$"
read MP3

sleep 1
echo reading file ...

# for the video :

IMG="$(ls -1 classical_paintings/*.jpg | shuf -n 1)"

ffmpeg -r 1 -loop 1 -i $IMG -i $MP3 -acodec copy -r 1 -shortest -vf scale=1280:720 ep1.flv 


sleep 1
echo probably done. goodbye!


