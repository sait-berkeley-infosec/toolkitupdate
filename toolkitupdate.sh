#!/bin/bash
# Script to automatically update toolkit files from online sources
# Written by Samuel Zhu <sjzhu@rescomp.berkeley.edu>
# Edited by Mina Li <limina@rescomp.berkeley.edu>

rm /export/teams/rcc/TOOLKIT/Malware\ Removal/mbam-rules.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ http://data-cdn.mbamupdates.com/tools/mbam-rules.exe 2>/dev/null

rm /export/teams/rcc/TOOLKIT/Malware\ Removal/MBAM.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ http://downloads.malwarebytes.org/file/mbam/ 2>/dev/null
mv /export/teams/rcc/TOOLKIT/Malware\ Removal/index.html /export/teams/rcc/TOOLKIT/Malware\ Removal/MBAM.exe

rm -rf /export/teams/rcc/TOOLKIT/Malware\ Removal/CCleaner/
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ http://www.piriform.com/ccleaner/download/portable//downloadfile 2>/dev/null
unzip /export/teams/rcc/TOOLKIT/Malware\ Removal/downloadfile -d /export/teams/rcc/TOOLKIT/Malware\ Removal/CCleaner/ 2>/dev/null
rm /export/teams/rcc/TOOLKIT/Malware\ Removal/downloadfile

rm /export/teams/rcc/TOOLKIT/Malware\ Removal/Rootkits/TDSSKiller.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/Rootkits/ http://media.kaspersky.com/utilities/VirusUtilities/EN/tdsskiller.exe 2>/dev/null
mv /export/teams/rcc/TOOLKIT/Malware\ Removal/Rootkits/tdsskiller.exe /export/teams/rcc/TOOLKIT/Malware\ Removal/Rootkits/TDSSKiller.exe

rm /export/teams/rcc/TOOLKIT/Malware\ Removal/ProcessExplorer.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ http://live.sysinternals.com/procexp.exe 2>/dev/null
mv /export/teams/rcc/TOOLKIT/Malware\ Removal/procexp.exe /export/teams/rcc/TOOLKIT/Malware\ Removal/ProcessExplorer.exe

rm /export/teams/rcc/TOOLKIT/Malware\ Removal/SUPER-Anti-Spyware.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ http://cdn.superantispyware.com/SUPERAntiSpyware.exe 2>/dev/null
mv /export/teams/rcc/TOOLKIT/Malware\ Removal/SUPERAntiSpyware.exe /export/teams/rcc/TOOLKIT/Malware\ Removal/SUPER-Anti-Spyware.exe

rm /export/teams/rcc/TOOLKIT/Networking/TCPview.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Networking/ http://download.sysinternals.com/files/TCPView.zip 2>/dev/null
unzip /export/teams/rcc/TOOLKIT/Networking/TCPView.zip 2>/dev/null
rm /export/teams/rcc/TOOLKIT/Networking/Eula.txt
rm /export/teams/rcc/TOOLKIT/Networking/Tcpvcon.exe
rm /export/teams/rcc/TOOLKIT/Networking/tcpview.chm
rm /export/teams/rcc/TOOLKIT/Networking/TCPVIEW.HLP
mv /export/teams/rcc/TOOLKIT/Networking/Tcpview.exe /export/teams/rcc/TOOLKIT/Networking/TCPview.exe

rm /export/teams/rcc/TOOLKIT/Malware\ Removal/Advanced/Autoruns.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/Advanced/ http://download.sysinternals.com/files/Autoruns.zip 2>/dev/null
unzip /export/teams/rcc/TOOLKIT/Malware\ Removal/Advanced/Autoruns.zip 2>/dev/null
rm /export/teams/rcc/TOOLKIT/Malware\ Removal/Advanced/autoruns.chm
rm /export/teams/rcc/TOOLKIT/Malware\ Removal/Advanced/autorunsc.exe
rm /export/teams/rcc/TOOLKIT/Malware\ Removal/Advanced/Eula.txt
mv /export/teams/rcc/TOOLKIT/Malware\ Removal/Advanced/autoruns.exe /export/teams/rcc/TOOLKIT/Networking/Autoruns.exe

rm /export/teams/rcc/TOOLKIT/Malware\ Removal/adwcleaner*.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ https://toolslib.net/downloads/finish/1/get/sRmO/ 2>/dev/null
