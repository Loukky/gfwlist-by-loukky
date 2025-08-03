#!/bin/bash -
# (C) Copyright 2009-2016 GFWList
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Shell script to maintain GFWList.
#   Features:
#     Update local svn repository;
#     Commit decoded changes(by others in your team) to local git repository
#             with decoded message and authors name;
#     Update "Last Modified" & "Checksum";
#     Commit your changes to local git repository;
#     Commit your encoded changes to remote svn server with encoded log;
#    Plus some error handling.
#   Usage:
#     Initialize:
#       $svn checkout https://autoproxy-gfwlist.googlecode.com/svn/trunk/ gfwList --username your-google-user-name
#       $cd gfwList
#       $git init
#       $openssl base64 -d -in gfwlist.txt -out list.txt
#       $git add list.txt
#       $git commit -a -m "init"
#     Normal Usage:
#       edit list.txt as usual;
#       $./sendGFWList.sh "say something about this edit"
#   Note:
#     1: You can use "$git log" "$git show" "$git diff"...;
#     2: Do NOT commit "list.txt" to svn server (it won't by default);
#     3: Do NOT use any unicode character in the list, there is a known bug;
#     4: Do NOT "svn update", run this script to update / commit at any time.
################################################################################

set -u


# Sanity check.
for cmd in date file git openssl perl python
do
  command -p $cmd &> /dev/null;
  if [[ $? -ne 0 ]]; then	
      echo "Error: You must have $cmd command installed on the system!";
  fi
done

# get formated author and log information
log=$(svn log --xml -r BASE:HEAD) || exit 1;
log=$(echo $log | awk -v RS='' -F '</?author>|</?msg>' '{ for(i=6;i<NF;i+=4) printf "%s:%s;",$i,$(i+2); }') &&

# convert from base64
i=0 &&
convertedLog="" &&
while [ "$log" != "" ]
do
  if (( $i%2 == 0 )); then # author
    temp=${log%%:*};
    convertedLog+=${temp%@*}; # don't include "@gmail.com"
    convertedLog+=": ";
    # discard used string
    log=${log#*:};
  else                # log, decode it
    temp=$( echo ${log%%;*} | openssl base64 -d );
    convertedLog+=$temp;
    convertedLog+="\n";
    log=${log#*;};
  fi
  ((i++));
done

# modified by others, commit to local git repository
if [ "$convertedLog" != "" ]; then
  git diff > temp.patch &&

  svn update || exit 1;

  openssl base64 -d -in gfwlist.txt -out list.txt &&
  ./validateChecksum.pl list.txt;
  if [ $? -ne 0 ]; then
    # recover, discard broken list.txt
    git checkout list.txt && git apply temp.patch && rm temp.patch;
    echo -e "\n\n\n*********************************************************\n";
    echo "Error: gfwlist.txt from svn is invalid!!!";
    echo "It must be a download error or somebody made a mistake.";
    echo -e "\nYou can simply run this script again to fix the problem.";
    echo "But wait...!"
    echo "This would overwrite all commits till your last update!!!";
    echo -e "\nIf you are confused, wait somebody else to fix it.";
    echo "Please always report this to our maintainers' group!";
    echo -e "\n*********************************************************\n\n\n";
    exit 1;
  fi

  echo -e $convertedLog | git commit -a -F - &&

  [ -s temp.patch ] && git apply temp.patch &&
  rm temp.patch;

  if [ -s temp.patch ]; then
    echo -e "\n\033[31mError:\033[0m git apply failed, your work saved at temp.patch\n";
    exit 1;
  elif [ -a temp.patch ]; then
    # empty, remove it
    rm temp.patch;
  fi
fi

if [ "$(git diff)" == "" ]; then
  echo "Info: list.txt not modified.";
  exit 0;
fi

if [ "$*" == "" ]; then
  echo "Error: empty log, please say something about this modification.";
  exit 1;
fi

# update date and checksum
./addChecksum.pl list.txt &&

if [ "$(file -b list.txt)" != "ASCII text" ]; then
  echo "Error: list.txt invalid, please make sure:";
  echo "1. there is no non-ASCII characters;";
  echo "2. configure your text editor to use unix style line break.";
  exit 1;
fi

# save local changes to git & svn
# if conflict or network problem occurs: do nothing & throw error message
git commit -a -m "$*" &&
(
  openssl base64 -in list.txt |
  # convert dos new line to unix style, old mac style ignored
  tr -d '\r' > gfwlist.txt &&

  # may be failed because of connection/authentication problems
  svn ci gfwlist.txt -m $( echo "$*" | openssl base64 | tr -d '\r\n' ) ||

  # "svn ci" and "git commit" are atomic operations
  git reset HEAD^ 1> /dev/null;
) &&

# BASE++ if committed
svn update 1> /dev/null;
