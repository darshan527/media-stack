#!/bin/bash

# FileBrowser Setup Script
# This script initializes the FileBrowser configuration and directory structure

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== FileBrowser Setup ===${NC}"

# Get environment variables or use defaults
APPDATA_PATH="${APPDATA_PATH:-./.appdata}"
MEDIA_PATH="${MEDIA_PATH:-./.media}"

# Create directory structure
echo -e "${BLUE}Creating directory structure...${NC}"
mkdir -p "${APPDATA_PATH}/filebrowser/tmp"
mkdir -p "${MEDIA_PATH}"

# Create config.yaml
CONFIG_FILE="${APPDATA_PATH}/filebrowser/config.yaml"
echo -e "${BLUE}Creating config file at ${CONFIG_FILE}...${NC}"

cat > "${CONFIG_FILE}" << 'EOF'
server:
  database: "/data/database.db"
  cacheDir: "/data/tmp"
  sources:
    - path: "/files"
      name: Media
      config:
        defaultUserScope: "/users/"
        defaultEnabled: true
        createUserDir: true
    - path: "/data"
      name: Backend
  maxArchiveSize: 5000

auth:
  tokenExpirationHours: 24
  methods:
    password:
      enabled: true
      minLength: 5
      signup: false
  adminUsername: admin
  adminPassword: admin
EOF

echo -e "${GREEN}✓ Config file created${NC}"
echo -e "${GREEN}✓ Directory structure created${NC}"
echo ""
echo -e "${BLUE}=== Setup Complete ===${NC}"
echo ""
echo "FileBrowser is now ready to run!"
echo ""
echo "Start the service with:"
echo "  docker compose up -d filebrowser"
echo ""
echo "Access FileBrowser at: http://localhost:8900"
echo "Default credentials: admin / admin"
echo ""
echo "⚠️  IMPORTANT: Change the admin password after first login!"
