# Laufwerk für die Datensicherung vorbereiten

Wenn Sie Backups mit root-Rechten speichern wollen, müssen Sie weiter nichts unternehmen. Andernfalls ändern Sie die Zugriffsrechte des eingebundenen Laufwerks, beispielsweise mit
```
sudo chmod 757 /mnt/[UUID]
```
Erstellen Sie über den Dateimanager als Standardbenutzer einen Backup-Ordner auf diesem Laufwerk.

# Backup einzelner Verzeichnisse erstellen
```
#!/bin/bash
DATE=$(date +%Y-%m-%d-%H%M%S)
BACKUP_DIR="/mnt/[UUID]/[Backup-Ordner]/"
SOURCE="$HOME"
tar -cvzpf $BACKUP_DIR/backup-home-$DATE.tar.gz $SOURCE
```
