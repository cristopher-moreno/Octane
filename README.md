# octane

Enhance your driving experience

Backup:
docker container exec -t postgres--db pg_dumpall -c -U octane > dump-`date +%d-%m-%Y"*"%H\_%M\*%S`.sql

Restore:
cat your_dump.sql | docker container exec -i postgres--db psql -U octane
