#!/bin/bash

source ~/config/config.sh
path="$DEV_PATH/shellScript"

List=("marconi   10.2.10.100" "$path/login.sh -s -i 10.2.10.100"
      "wms       10.2.10.103" "$path/login.sh -s -i 10.2.10.103"
      "wms con   10.2.10.103" "telnet 10.2.10.21 3006"
      "wms       10.2.10.56"  "$path/login.sh -s -i 10.2.10.56"
      "lmc       10.2.10.71"  "$path/login.sh -s --lmc -i 10.2.10.71"
      "root      10.2.10.20"  "$path/login.sh -s -i 10.2.10.20 -u root -p $LILEE_PW"
#      "root      10.2.10.51"  "$path/login.sh -s -i 10.2.10.51 -u root -p $LILEE_PW3"
      "builder   10.1.10.20"  "$path/login.sh -s -i 10.1.10.20 -u builder -p $LILEE_PW4"
      "builder64 10.1.10.21"  "$path/login.sh -s -i 10.1.10.21 -u root -p $LILEE_PW2"
      "ethan"                 "$path/login.sh -s -i ethan-yang.no-ip.org -u $CUSTOM_PW")


echo -e "===== LIST ====="
for ((i=0, j=1; i<${#List[@]}; i++, i++, j++)); do
	echo "$j. ${List[$i]}"
done
echo -e ""

read -p "Input a choice : " ch

case "$ch" in
  [[:lower:]] )  echo "You MUST input a number." && exit 0 ;;
  [[:upper:]] )  echo "You MUST input a number." && exit 0 ;;
  [[:digit:]]*)  ;;
  *           )  echo "You MUST input a number." && exit 0 ;;
esac      #  Allows ranges of characters in [square brackets],


if [ $ch -ge $j ]; then
	echo "It should be in range 1-$(($j-1))" && exit 0
fi

eval ${List[$(($ch*2-1))]}



