# Laufwerk für die Datensicherung vorbereiten

Wenn Sie Backups mit root-Rechten speichern wollen, müssen Sie weiter nichts unternehmen. Andernfalls ändern Sie die Zugriffsrechte des eingebundenen Laufwerks, beispielsweise mit
```bash
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
Machen Sie das Script mit
```
chmod +x tar-Backup.sh
```
ausführbar und starten Sie es im Terminal mit
```
sh tar-Backup.sh
```
Wenn Sie Ordner sichern wollen, für die Sie keine Zugriffsrechte besitzen, starten Sie das Script mit vorangestelltem sudo.

**Alternative Backup mit rsync:**
Mit rsync lassen sich platzsparendere Sicherungen erstellen und das Tool arbeitet schneller als tar. Dafür tauschen Sie in obigem Script die letzte Zeile durch
```
rsync -auP $SOURCE/ $BACKUP_DIR
```
aus. Achten Sie auf den abschließenden „/“ hinter „$SOURCE“.

# Backups per Systemd automatisieren
Systemd startet Dienste oder Scripte automatisch beim Systemstart oder nach Zeitplan. Für ein automatisches Backup benötigen Sie die Konfigurationsdateien „backup.timer“ und „backup.service“, die Sie in den Ordner „/etc/systemd/system“ kopieren. In „backup.service“ passen Sie den Pfad zum Backup-Script an. In der Datei „tar-Backup.sh“ entfernen Sie hinter „SOURCE=“ die Variable und tragen den Pfad für den Ordner ein, den Sie sichern wollen.

Führen Sie die folgenden drei Befehlszeilen im Terminal aus:
```
systemctl daemon-reload
systemctl enable backup.timer
systemctl start backup.timer
```
„backup.timer“ ist über die Zeile „OnCalendar=*-*-* 18:00:00“ für ein tägliches Backup um 18:00 Uhr konfiguriert. 
Wenn Sie rsync für Backups verwenden wollen, tragen Sie in „backup.service“ hinter „ExecStart=“ die gewünschte Befehlszeile ein.

