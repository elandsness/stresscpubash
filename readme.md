Synopsis

This simple bash script can be used to launch multiple dd threads in an effort to spike cpu 
usage for the purpose of burning in hardware or testing the performance of thermal solutions 
utilized by the hardware.

Code Example

stresscpu.sh 9 30 #This will spawn 9 processes for 30 seconds.  If you are looking to peg the 
CPU to 100% of available resources, set the number of processes to spawn to the number of 
threads your CPU can handle plus one.

Motivation

I created this script to simulate max load on my computer to test the thermal performance of 
my small formfactor machine.

Installation

Just download the script, make it executable and run it.  Must have bash, obviously.

License

This software is being provided under the GNU GENERAL PUBLIC LICENSE v3. Please see included 
license file for additional information.
# stresscpubash
