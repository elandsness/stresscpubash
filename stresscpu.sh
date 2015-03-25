#!/bin/bash

##    Copyright 2015 Erik Landsness
##
##    stresscpu.sh is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or any later version.
##
##    stresscpu.sh is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with stresscpu.sh.  If not, see <http://www.gnu.org/licenses/>.

#usage: stresscpu.sh <procs> <secs> or stresscpu.sh -h for help
#with no args defaults to numCores+1 and 60 secs
numProcs=$(nproc 2>&1)
numProcs=$((numProcs+1))
if [ ! -z $1 ]; then
   numProcs=$1
fi

duration=60
if [ ! -z $2 ]; then
   duration=$2
fi


#setup bashtrap
trap bashtrap INT

#function to end cpu stress cycles
function cleanup {
   echo "Cleaning up..."
   killall -9 dd
}

#cleanup if canceled early
bashtrap(){
   echo " CPU stress cycle canceled."
}

if [ $1 = '-h' ]; then
   echo 'Usage ./stresscpu.sh <number processes> <duration in seconds>'
else
   for i in `seq 1 $numProcs`
   do
      echo "Spawning process $i"
      dd if=/dev/urandom | bzip2 -9 >> /dev/null &
   done

   echo "Running for $duration seconds"
   sleep $duration
   cleanup
   echo "Done!"
fi
