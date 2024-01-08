#!/bin/bash
DATE=$(date +%Y-%m-%d-%H%M%S)
BACKUP_DIR="/mnt/[UUID]/[Backup-Ordner]/"
SOURCE="$HOME"
tar -cvzpf $BACKUP_DIR/backup-home-$DATE.tar.gz $SOURCE
