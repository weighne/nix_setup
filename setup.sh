#!/bin/sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    inst_cmd="apt-get install"
else
    inst_cmd="pkg_add"
fi

echo "$inst_cmd"

input="pkgs.txt"

while IFS= read -r line
do
   $inst_cmd $line
done < "$input"

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

nanorc_temp="nanorc_temp.txt"

cat $nanorc_temp >> ~/.nanorc
