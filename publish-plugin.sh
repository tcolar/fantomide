echo "NB target Release? (Ex: 6.9)"
read version
cd release/plugin/
scp -r * root@www.colar.net:/data/websites/apache/Perso/fantomide/plugin/$version

