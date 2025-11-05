# 🎬 Media Server Stack

A Docker Compose setup for managing and automating your media server needs. This stack includes torrent management, media organization, and request management capabilities.

## 📋 Services

- **qBittorrent**: Torrent client with a web interface
- **Prowlarr**: Indexer aggregator for finding media
- **Sonarr**: TV show collection manager
- **Radarr**: Movie collection manager
- **Jellyseerr**: Media request and discovery manager
- **Bazarr** (Optional): Subtitle management

## 🚀 Getting Started

### Prerequisites

1. Install Docker and Docker Compose
2. Create the necessary directories:
   ```bash
   mkdir -p /DATA/AppData/{qbittorrent,prowlarr,sonarr,radarr,jellyseerr}
   mkdir -p ~/Media/{Downloads,TV,Movies}
   ```

### Configuration

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Update the `.env` file with your settings:
   ```env
   PUID=1000            # Your user ID
   PGID=1000           # Your group ID
   TZ=Asia/Kolkata     # Your timezone
   APPDATA_PATH=<config path>
   MEDIA_PATH=<media path>
   ```

### Installation

1. Start the stack:
   ```bash
   docker compose up -d
   ```

2. Access the services:
   - qBittorrent: http://localhost:8080
   - Prowlarr: http://localhost:9696
   - Sonarr: http://localhost:8989
   - Radarr: http://localhost:7878
   - Jellyseerr: http://localhost:5055

3. Stop the stack:
    ```bash
    docker compose down
    ```

## 🔧 Service Configuration

### qBittorrent
- Default credentials: admin/adminadmin
- Configure download paths in Settings → Downloads
- Set up port forwarding if needed (port 6881)

### Prowlarr
- Add indexers/trackers
- Configure applications (Sonarr/Radarr) for automatic indexer sync

### Sonarr/Radarr
1. Add qBittorrent as download client
2. Configure quality profiles
3. Set up root folders:
   - Sonarr: `/tv`
   - Radarr: `/movies`

### Jellyseerr
- Set up connections to Sonarr and Radarr
- Configure user access and request limits

## 📝 Optional Services

### Bazarr (Subtitle Management)
To enable Bazarr:
1. Uncomment the Bazarr service section in `docker-compose.yml`
2. Create the config directory: `mkdir -p /DATA/AppData/bazarr`
3. Restart the stack

## 🛠️ Maintenance

### Updating Services
```bash
docker-compose pull   # Pull new images
docker-compose up -d  # Recreate containers
```

### Backup
Important directories to backup:
- `/DATA/AppData/*` - Service configurations
- `.env` file - Environment variables

## 🔐 Security Notes

- Change default passwords
- Use strong passwords
- Consider using a VPN for torrent traffic
- Restrict access to service UIs if exposed to the internet

## 📁 Directory Structure
```
.
├── docker-compose.yml
├── .env
└── README.md
```

## 🤝 Contributing
Feel free to open issues and submit pull requests.

## 📄 License
This project is licensed under the MIT License.