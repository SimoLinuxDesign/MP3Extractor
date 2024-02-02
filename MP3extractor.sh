#!/bin/bash
#################################################################################
#                          Sezione Variabile colori                             #
#################################################################################
und=$(tput smul)     	 # attiva il sottolineato
nound=$(tput rmul)  	 # disattiva il sottolineato
bold=$(tput bold)   	 # attiva il grassetto
rev=$(tput rev)          # attiva la modalità inversa 
                         # (scambia sfondo e carattere)
normal=$(tput sgr0)      # annulla tutti gli effetti e torna al default
tred=$(tput setaf 1)     # carattere rosso
tgreen=$(tput setaf 2)   # carattere verde
tyellow=$(tput setaf 3)  # carattere giallo
tblue=$(tput setaf 4)    # carattere blu
tpurple=$(tput setaf 5)  # carattere porpora
tcyan=$(tput setaf 6)    # carattere ciano (azzurro)
twhite=$(tput setaf 7)   # carattere bianco
bred=$(tput setab 1)   	 # sfondo carattere rosso
bgreen=$(tput setab 2)   # sfondo carattere verde
byellow=$(tput setab 3)  # sfondo carattere giallo
bblue=$(tput setab 4)    # sfondo carattere blu
bpurple=$(tput setab 5)  # sfondo carattere porpora
bcyan=$(tput setab 6)    # sfondo carattere ciano (azzurro)
bwhite=$(tput setab 7)   # sfondo carattere bianco
################################################################################
clear

######################## MAIN VARIABLES ####################
version="v1.0"
NameOutput="FileMp3"
folfInput=""
foldOutput=""
github="https://github.com/SimoLinuxDesign/MP3Extractor.git"
userdev="SimoLinuxDesign"
############################################################

################### DESCRIPTION PROGRAM ####################
echo "#####################################################"$bblue
echo "                                                     "
echo "              Welcome in MP3 extractor!              "
echo "                                                     "$normal
echo "#####################################################"$bcyan
echo "                                                     "
echo " Welcome to the MP3-Extractor $version.                  "
echo " Follow all the guided procedure to extract all mp3  "
echo " from one folder to another.                         "                                       
echo " You can select your input and output folder during  "
echo " the process.                                        "
echo "                                                     "$normal
echo "-----------------------------------------------------"$bblue
echo " For more information, check the GitHub Repository:  "
echo $tpurple$bold"$github  "$normal$bblue
echo " Developer:$tgreen$userdev                           "$normal
echo "#####################################################"
echo "Press 'Enter' to continue"
read continue
clear
############################################################

################# KBPS TABLE #######################
echo "#################################################"
echo " Select the kbps that you want to use to convert"
echo "#################################################"
echo ""
echo           $tgreen" 1 = 96k"$normal
echo            $tblue" 2 = 128k "$normal
echo            $tcyan" 3 = 192k "$normal         
echo          $tyellow" 4 = 256k "$normal           
echo          $tpurple" 5 = 320k "$normal           
echo            $tred" q = Quit Program"$normal
echo ""
echo "#################################################"
echo ""
########################################################

################### KBPS SELECTION #####################
kbps=0
while [ "$kbps" != "1" ] && [ "$kbps" != "2" ] && [ "$kbps" != "3" ] && [ "$kbps" != "4" ] && [ "$kbps" != "5" ] && [ "$kbps" != "q" ];
do
	read kbps
	case $kbps in
		1)
		kbpsDone="96k"
		sel1=$tgreen"96kbps"$normal
		echo $sel1
		;;
		2)
		kbpsDone="128k"
		sel1=$tblue"128kbps"$normal
		echo $sel1
		;;
		3)
		kbpsDone="192k"
		sel1=$tcyan"192kbps"$normal
		echo $sel1
		;;
		4)
		kbpsDone="256k"
		sel1=$tyellow"256kbps"$normal
		echo $sel1
		;;
		5)
		kbpsDone="320k"
		sel1=$tpurple"320kbps"$normal
		echo $sel1
		;;
		"q")
		echo "Quit program selected"
		exit
		;;
		*)
		echo "Wrong button pressed"
		;;
	esac
done	
########################################################

######################## HZ TABLE ######################
clear
echo "#############################################"
echo "$sel1"
echo "#############################################"
echo "Select the hz that you want to use to convert"
echo "#############################################"
echo ""
echo           $tgreen"1 = 8000hz                  "
echo            $tblue"2 = 11025hz                 "
echo            $tcyan"3 = 22050hz                 " 
echo          $tyellow"4 = 44100hz                 " 
echo          $tpurple"5 = 48000hz                 " 
echo             $tred"q = Quit Program$normal     "
echo ""
echo "#############################################"
########################################################

##################### HZ SELECTION #####################

echo ""

hz=0
while [ "$hz" != "1" ] && [ "$hz" != "2" ] && [ "$hz" != "3" ] && [ "$hz" != "4" ] && [ "$hz" != "5" ] && [ "$hz" != "q" ];
do
	read hz
	case $hz in
		1)
		hzDone="8000"
		sel2=$tgreen"8000hz"$normal
		echo $sel2
		;;
		2)
		hzDone="11025"
		sel2=$tblue"11025hz"$normal
		echo $sel2
		;;
		3)
		hzDone="22050"
		sel2=$tcyan"22050hz"$normal
		echo $sel2
		;;
		4)
		hzDone="44100"
		sel2=$tyellow"44100hz"$normal
		echo $sel2
		;;
		5)
		hzDone="48000"
		sel2=$tpurple"48000hz"$normal
		echo $sel2
		;;
		"q")
		echo "Quit program selected"
		exit
		;;
		*)
		echo "Wrong button pressed"
		;;
	esac
done	
clear
########################################################

#################### SHOW SELECTION ####################
echo $tyellow"#############################################"$normal
echo "         $sel1 has been selected.       "$normal
echo $tyellow"#############################################"$normal
echo "         $sel2 has been selected.       "$normal
echo $tyellow"#############################################"$normal
########################################################

############ SELECT INPUT FOLDER WITH CHECK ############
while true; do
		echo $bold$tcyan"Write the path from where you want to get all your mp4 files:$normal$tblue"
    read foldInput
		if [ -n "$(find "$foldInput" -maxdepth 1 -type f -name '*.mp4' -print -quit)" ]; then
			clear
			echo $normal"-----------------------------------------------------------------------------"
    	echo $tgreen$bold"Mp4 files founds in: $twhite $foldInput"$normal
			echo $normal"-----------------------------------------------------------------------------"
    	break
		else
			clear
			echo $normal"--------------------------------------------------------------------------------------------------"
    	echo $tred$bold"There is not any MP4 files in the folder:$normal $foldInput$bold$tred. Try again"$normal
			echo "--------------------------------------------------------------------------------------------------"$normal
		fi
done
cd $foldInput
##############################################################

################### SELECT OUTPUT FOLDER #####################
echo "####################################################################"
echo $bold$tpurple"Write the path where you wish bring all your mp4 files:$normal$tblue"
read foldOutput
echo "$normal"
clear
############################################################

#################### SHOW SELECTION 2 ######################
echo $tyellow"#############################################"$normal
echo "$sel1 has been selected.       "$normal
echo $tyellow"#############################################"$normal
echo "$sel2 has been selected.       "$normal
echo $tyellow"#############################################"$normal
echo "Input mp4 folders:$tblue$bold$foldInput"$normal
echo $tyellow"#############################################"$normal
echo "Output mp3 folders:$tpurple$bold$foldOutput"$normal
echo $tyellow"#############################################"$normal
###########################################################

################## START EXTRACTION #######################
for i in *.mp4; do
ffmpeg -i "$i" -ab ${kbpsDone} -ar ${hzDone}  "$(basename "$i" .mp4)".mp3
done
clear
read -p $tbold$tgreen"Extraction Done!$normal Press 'enter' to continue... " continue
###########################################################

############### MOVING EXTRACTED FILES ####################
test -d $foldOutput || mkdir -p $foldOutput && mv *.mp3 $foldOutput
###########################################################

##################### FINISH OPERATIONS ###################
clear
echo $bold$tgreen"Operation Completed!"$normal
echo "You can find all the filse to this path:"
echo $tpurple"$foldOutput"$normal$bold
read -p "Press 'Enter' to close the program!" continua
exit 0
