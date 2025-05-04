# --- Bitcoin Node RPC Einstellungen ---
# IP oder Hostname deiner Bitcoin Node (muss erreichbar sein vom Container)
BITCOIN_RPC_URL=http://192.168.75.128
BITCOIN_RPC_USER=rpcuser
BITCOIN_RPC_PASSWORD=rpcpassword
BITCOIN_RPC_PORT=8332
BITCOIN_RPC_TIMEOUT=10000

# Alternativ zu User+Pass (wird derzeit nicht verwendet)
BITCOIN_RPC_COOKIEFILE=

# --- Bitcoin ZMQ Verbindung ---
# Muss in deiner bitcoin.conf aktiviert sein z.B.:
# zmqpubrawblock=tcp://0.0.0.0:28334
# zmqpubrawtx=tcp://0.0.0.0:28333
BITCOIN_ZMQ_HOST=tcp://192.168.75.128:28334

# --- Public-Pool Ports ---
API_PORT=3334
STRATUM_PORT=19000

# --- Optionale Integrationen ---
#TELEGRAM_BOT_TOKEN=
#DISCORD_BOT_CLIENTID=
#DISCORD_BOT_GUILD_ID=
#DISCORD_BOT_CHANNEL_ID=

#DEV_FEE_ADDRESS=

# --- Netzwerk & Konfiguration ---
NETWORK=mainnet
API_SECURE=false
POOL_IDENTIFIER="Unraid-Pool"
