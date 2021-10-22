#!/bin/sh

. ./.common.sh

echo "${bold}*************************************"
echo "Generate node key and a genesis file"
echo "*************************************${normal}"
if [ ! -f "ibftConfigFile.json" ]; then
    echo "ibftConfigFile not found"
    exit 1
fi

besu operator generate-blockchain-config --config-file=ibftConfigFile.json --to=networkFiles --private-key-file-name=key
keys="$(ls networkFiles/keys)"
keys=($keys)
echo "Success\n"

echo "${bold}*************************************"
echo "Copy the genesis file to the network directory"
echo "*************************************${normal}"
cp networkFiles/genesis.json .
echo "Success\n"

echo "${bold}*************************************"
echo "Copy the genesis file to the network directory"
echo "*************************************${normal}"
for i in `seq 0 3`; do
    if [ ! -e node${i}/data/key ] && [ ! -e node${i}/data/key.pub ]; then
        cp networkFiles/keys/${keys[i]}/* node${i}/data
    else
        echo "node${i} already exists"
    fi
done
echo "Success\n"
