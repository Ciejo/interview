# Interview

The challenge was to deploy a tendermint chain - Show a running cosmos SDK chain with multiple validators (> 2) using tendermint.

You can choose to deploy this, and give access to some endpoints + logs, or provide them with a simple interface (i.e. docker-compose, or other) to reproduce the environment.

## Documentation

Following tendermint [website](https://docs.tendermint.com/) and doing some changes according to what I found on tendermint github [scripts](https://github.com/tendermint/tendermint/tree/v0.34.24/networks/local/localnode), a final docker-compose file was created in order to deploy 4 nodes that will run a testnet with a two commands.

## Run

docker pull ciejo/node:v1 
docker-compose up -d