# blckheck.sh v1.0
# Vahit GÜMÜŞ - https://www.vaihtgumus.com
# Created  by Vahit GÜMÜŞ 04.2012   Check ip address is listed or mot  in blaclist sites



#!/bin/bash

if [ $# -eq 0 ]; then
echo -n "Enter the IP Address of Mail Server:"
#read the IP from cmd line
read IPAddr
else
IPAddr=$1
fi

if [ "$IPAddr" == "" ]; then
echo "ip bos " exit
else

#Reverse the IP…
ipaddr1=`echo $IPAddr | awk -F. '{print $1}'`
ipaddr2=`echo $IPAddr | awk -F. '{print $2}'`
ipaddr3=`echo $IPAddr | awk -F. '{print $3}'`
ipaddr4=`echo $IPAddr | awk -F. '{print $4}'`

##check the IP format here
if [ "$ipaddr1" == "" ]; then
echo "Please enter the Valid IP addresas"
exit
elif [ "$ipaddr2" == "" ]; then
echo "Please enter the Valid IP address"
exit
elif [ "$ipaddr3" == "" ]; then
echo "Please enter the Valid IP addressi"
exit
elif [ "$ipaddr4" == "" ]; then
echo "Please enter the Valid IP address"
exit
fi
### create reverse IP
RevIP=${ipaddr4}.${ipaddr3}.${ipaddr2}.${ipaddr1}
echo "Queried IP  $IPAddr "
#echo "Queried IP  $IPAddr , Reverse format :- ${RevIP}"
echo "---------------------------------------------"
for check in b.barracudacentral.org dnsbl.sorbs.net spam.dnsbl.sorbs.net bl.spamcop.net zen.spamhaus.org cbl.abuseat.org ips.backscatterer.org \
dnsbl-0.uceprotect.net dnsbl-1.uceprotect.net dnsbl-2.uceprotect.net dnsbl-3.uceprotect.net \
combined.njabl.org dsn.rfc-ignorant.org ers.trendmicro.com

#l1.spews.dnsbl.sorbs.net

do
#run cmd to check the IP black listed or not #dig +short ${RevIP}.$check >> /dev/null
sonuc=`dig +short ${RevIP}.$check | grep 127 | wc -l `
#echo "dig +short $RevIP.$check"

if [ "$sonuc" -eq 0 ]; then
#echo $sonuc
#echo "The ${IPAddr} IS White Listed in $check"
echo "  OK   : $check  "
else
#echo $sonuc
echo "LISTED : $check "
fi
done
echo " "
#echo "dig +short $RevIP.$check"
fi
