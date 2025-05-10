# Public Pool for Unraid

A comprehensive Docker template to run your own Bitcoin mining pool with web interface using public-pool and public-pool-ui on Unraid systems.

## Overview

This project provides an all-in-one solution for running a solo mining pool server, combining both the backend (public-pool) and frontend (public-pool-ui) components in a single, easy-to-deploy container optimized for Unraid users.

## Features

- ✅ Complete mining pool solution with web interface
- ✅ Solo mining pool functionality
- ✅ Real-time statistics and monitoring
- ✅ Easy configuration through Unraid's UI
- ✅ Persistent data storage for shares and statistics
- ✅ SQLite database integration
- ✅ ZMQ support for real-time block notifications
- ✅ Customizable pool identifier
- ✅ Supports both mainnet and testnet

## Prerequisites

- Unraid 6.8.0 or later
- Running Bitcoin Core node with:
  - RPC enabled
  - ZMQ notifications configured
- Docker enabled in Unraid
- Basic understanding of Bitcoin mining concepts

## Configuration

### Required Settings

| Setting | Description | Default |
|---------|-------------|---------|
| Bitcoin RPC URL | URL of your Bitcoin node | `http://192.168.1.100` |
| Bitcoin RPC User | Username from your bitcoin.conf | `rpcuser` |
| Bitcoin RPC Password | Password from your bitcoin.conf | `rpcpassword` |
| Bitcoin ZMQ Host | ZMQ address of your Bitcoin node | `tcp://192.168.1.100:28334` |

### Port Configuration

| Port | Service | Default |
|------|---------|---------|
| 3333 | Stratum Mining | 3333 |
| 3334 | API | 3334 |
| 8080 | Web UI | 8080 |

### Bitcoin Core Configuration

Ensure your `bitcoin.conf` includes:
```
# RPC settings
server=1
rpcuser=yourusername
rpcpassword=yourpassword
rpcallowip=192.168.0.0/16

# ZMQ settings
zmqpubrawblock=tcp://0.0.0.0:28334
zmqpubrawtx=tcp://0.0.0.0:28333
```

## Usage

After installation, access the web interface at:
```
http://[YOUR-UNRAID-IP]:8080
```

Connect your miners using:
- **Stratum URL**: `stratum+tcp://[YOUR-UNRAID-IP]:3333`
- **Username**: Your Bitcoin address
- **Password**: `x` (or any value)

## Data Persistence

The container stores data in two locations:
- `/app/data` - Pool shares and statistics
- `/app/mainnet-DB` - SQLite database

Both are mapped to your appdata folder by default to ensure data persistence between container restarts.

## Troubleshooting

### Common Issues

1. **ZMQ Connection Failed**
   - Verify your Bitcoin node has ZMQ enabled
   - Check firewall settings between containers
   - Ensure the ZMQ port is correct

2. **RPC Authentication Failed**
   - Double-check your RPC username/password
   - Verify the Bitcoin node is accessible from the container network

3. **Web UI Not Accessible**
   - Check if the container is running
   - Verify port mappings
   - Review container logs for errors

### Viewing Logs

```bash
docker logs public-pool
```

## Support

- For template-specific issues, visit the [Unraid Forums support thread](https://forums.unraid.net/topic/112959-support-animal-templates-repo/)
- For public-pool issues, see the [original project](https://github.com/benjamin-wilson/public-pool)

## Credits

This project is a Docker implementation of:
- [public-pool](https://github.com/benjamin-wilson/public-pool) by Benjamin Wilson
- [public-pool-ui](https://github.com/benjamin-wilson/public-pool-ui) by Benjamin Wilson

## License

This template is distributed under the terms specified by the original public-pool project. Please refer to their repositories for license information.

## Related Projects

This project would not have been possible without the following related projects:
- [OSMU](https://osmu.wiki/) - Open Source Mining Union

## Donations

If you like this project and want to support future work, feel free to donate to:

#### **Bitcoin:**  
![BTC QR Code](https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=bc1qm9qkpkz29mjsyn5k4hwezf7gxg4gnleh85k0wnm8)  
`bc1qm9qkpkz29mjsyn5k4hwezf7gxg4gnleh85k0wnm8`
##
#### **Lightning:**  
![Lightning QR Code](https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https://getalby.com/p/animai)  
[getalby.com/p/animai](https://getalby.com/p/animai)
