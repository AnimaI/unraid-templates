#!/bin/sh
CONFIG_FILE="/.bitcoin/bitcoin.conf"

# Check for invalid configuration
if [ "$BITCOIN_PRUNE" != "0" ] && [ "$BITCOIN_TXINDEX" = "1" ]; then
  echo "ERROR: Invalid configuration detected!" >&2
  echo "You have enabled both pruning (prune=$BITCOIN_PRUNE) and transaction indexing (txindex=1)." >&2
  echo "This combination is not supported by Bitcoin Core and will prevent the node from starting." >&2
  echo "Please set Transaction Index to 0 when using pruned mode, or use prune=0 for a full node." >&2
  # Exit with error code to show failure in Unraid logs
  exit 1
fi

# Configure Bitcoin data directory
if [ ! -z "$BITCOIN_DATADIR" ]; then
  echo "datadir=$BITCOIN_DATADIR" > $CONFIG_FILE
fi

# Configure debug log file
if [ ! -z "$BITCOIN_LOGDIR" ]; then
  echo "debuglogfile=$BITCOIN_LOGDIR/debug.log" >> $CONFIG_FILE
fi

# Configure pruning
echo "prune=$BITCOIN_PRUNE" >> $CONFIG_FILE

# Configure transaction index
echo "txindex=$BITCOIN_TXINDEX" >> $CONFIG_FILE

# Create directories if they don't exist
mkdir -p $BITCOIN_DATADIR
mkdir -p $BITCOIN_LOGDIR

# Start Bitcoin daemon
exec /usr/local/bin/bitcoind -printtoconsole
