#!/usr/bin/env ruby
# encoding: UTF-8
#Freifunk node highscore game
#Copyright (C) 2012 Anton Pirogov
#Licensed under The GPLv3

#--------
#Settings
#--------
#

#source path of node data
JSONSRC='http://map.freifunk-muenchen.de/nodes.json'

#password for commands over GET requests
PWD='hackmenot'

#score values
SC_OFFLINE=-100
SC_GATEWAY=100
SC_PERCLIENT=25
SC_PERVPN=10 #divided by quality
SC_PERMESH=50 #divided by quality

#fun option - penalty for Apple devices connected
PUNISHAPPLE=true
SC_PERAPPLE=-15

#----

#hide following nodes from scores
BLACKLIST=['VPN GW01','VPN GW03','VPN GW04']

#----

#enable logging
LOG=true
