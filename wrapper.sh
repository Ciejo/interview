#!/usr/bin/env sh

##
## Input parameters
##
BINARY=/usr/bin/tendermint
ID=${ID:-0}
LOG=${LOG:-tendermint.log}

##
## Assert linux binary
##
if ! [ -f "${BINARY}" ]; then
	echo "The binary $(basename "${BINARY}") cannot be found. Please add the binary to the shared folder. Please use the BINARY environment variable if the name of the binary is not 'tendermint' E.g.: -e BINARY=tendermint_my_test_version"
	exit 1
fi
BINARY_CHECK="$(file "$BINARY" | grep 'ELF 64-bit LSB executable, x86-64')"
if [ -z "${BINARY_CHECK}" ]; then
	echo "Binary needs to be OS linux, ARCH amd64"
	exit 1
fi

##
## Run binary with all parameters
##
export TMHOME="/tendermint/node${ID}"

if [ -d "`dirname ${TMHOME}/${LOG}`" ]; then
  "$BINARY" "$@" | tee "${TMHOME}/${LOG}"
else
  "$BINARY" "$@"
fi

##
## Adding command to start testnet
##

if [ ! -f $TMHOME/config/genesis.json ]; then 
 $BINARY testnet --config /etc/tendermint/config-template.toml --o . --starting-ip-address 192.167.20.2
fi

chmod 777 -R /tendermint