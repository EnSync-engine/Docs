# Running EnSync on Docker Compose

#### List Events
```bash
name: ensync-engine
services:
  master-node:
    image: ensync/master-node:latest
    depends_on:
      - config-manager
    ports:
      - "8082:8082"
      - "8443:8443"
    volumes:
      - type: bind
        source: /${STORAGE_DIR}
        target: /${STORAGE_DIR}
    networks:
      - ensync-shared-network
    restart: unless-stopped
  config-manager:
    image: ensync/config-manager:latest
    ports:
      - "5001:5001"
      - "8080:8080"
    volumes:
      - ensync_data:/app/data
    networks:
     - ensync-shared-network
    restart: unless-stopped
networks:
  ensync-shared-network:
    driver: bridge
volumes:
  ensync_data:



```