#!/bin/bash
# Script to automatically update toolkit files from online sources
# Written by Samuel Zhu <sjzhu@rescomp.berkeley.edu>

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
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ http://live.sysinternals.com/procexp.exe 2>/dev/null
rm /export/teams/rcc/TOOLKIT/Malware\ Removal/ProcessExplorer.exe
mv /export/teams/rcc/TOOLKIT/Malware\ Removal/procexp.exe /export/teams/rcc/TOOLKIT/Malware\ Removal/ProcessExplorer.exe
rm /export/teams/rcc/TOOLKIT/Malware\ Removal/SUPER-Anti-Spyware.exe
/usr/bin/wget -P /export/teams/rcc/TOOLKIT/Malware\ Removal/ http://cdn.superantispyware.com/SUPERAntiSpyware.exe 2>/dev/null
mv /export/teams/rcc/TOOLKIT/Malware\ Removal/SUPERAntiSpyware.exe /export/teams/rcc/TOOLKIT/Malware\ Removal/SUPER-Anti-Spyware.exe
