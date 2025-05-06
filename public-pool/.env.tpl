# --- Bitcoin Node RPC Settings ---
# IP or hostname of your Bitcoin node (must be accessible from the container)

BITCOIN_RPC_URL=http://192.168.1.100
BITCOIN_RPC_USER=rpcuser
BITCOIN_RPC_PASSWORD=rpcpassword
BITCOIN_RPC_PORT=8332
BITCOIN_RPC_TIMEOUT=10000
# Alternative to User+Pass (currently not used)
BITCOIN_RPC_COOKIEFILE=

# --- Bitcoin ZMQ Connection ---
# Must be enabled in your bitcoin.conf, e.g.:
# zmqpubrawblock=tcp://0.0.0.0:28334
# zmqpubrawtx=tcp://0.0.0.0:28333
BITCOIN_ZMQ_HOST=tcp://192.168.1.100:28334

# --- Public-Pool Ports ---
API_PORT=3334
STRATUM_PORT=3333
UI_PORT=8080

# --- Optional Integrations ---
#TELEGRAM_BOT_TOKEN=
#DISCORD_BOT_CLIENTID=
#DISCORD_BOT_GUILD_ID=
#DISCORD_BOT_CHANNEL_ID=
#DEV_FEE_ADDRESS=

# --- Network & Configuration ---
NETWORK=mainnet
API_SECURE=false
POOL_IDENTIFIER="Unraid-Pool"
