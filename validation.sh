#!/bin/sh

# apt-get install curl -y

# DNS Validation

echo "-------- DNS --------"

echo -e "DIG REVERSE SELF:\n$(dig +short -x 127.0.0.1)"
echo "DIG REVERSE SERVERPRO: $(dig +short -x 192.168.2.1)"
echo "DIG SERVERPRO: $(dig +short serverpro.localdomain)"
echo "DIG REVERSE CLIENTPRO: $(dig +short -x 192.168.2.11)"
echo "DIG CLIENTPRO: $(dig +short client1.localdomain)"

randomDynamicIPV4=$(( $RANDOM % 32 + 32 ))
echo "DIG REVERSE ip0$randomDynamicIPV4: $(dig +short -x 192.168.2.$randomDynamicIPV4)"
echo "DIG ip0$randomDynamicIPV4: $(dig +short ip0$randomDynamicIPV4.localdomain)"

echo "DIG SMTP: $(dig +short smtp.localdomain)"
echo "DIG POP3: $(dig +short pop3.localdomain)"
echo "DIG NAMESERVER: $(dig +short ns1.localdomain)"

# DHCP Validation

echo "-------- DHCP --------"

ifconfig eth0
read -p "MANUALLY CHECK IP OF CLIENT2 (enter to continue)"

# SSH Validation

echo "-------- SSH --------"

read -p "MANUALLY CHECK SSH TO SERVERPRO (enter to continue)"

# EMAIL Validation

echo "-------- EMAIL --------"

read -p "MANUALLY SEND EMAIL TO BOB AND SHOW RECEIVE (enter to continue)"

# WWW Validation

echo "-------- WWW --------"

declare -a wwwDomains=("www.localdomain" "localdomain" "www.cosc301.otago.nz")

for domain in "${wwwDomains[@]}" 
do
	echo "==> CURL $domain"
	curl $domain
done

