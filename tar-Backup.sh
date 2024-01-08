#!/bin/bash
DATE=$(date +%Y-%m-%d-%H%M%S)
BACKUP_DIR="/mnt/[UUID]/[Backup-Ordner]/"
# Bei Verwendung mit backup.timer bitte
# einen Pfad eintragen.
# Beispielsweise /home/[user]/Dokumente.
SOURCE="$HOME"
tar -cvzpf $BACKUP_DIR/backup-home-$DATE.tar.gz $SOURCE
# Mit rsync
# rsync -auP $SOURCE/ $BACKUP_DIR
