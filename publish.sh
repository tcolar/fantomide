# TODO: parse from project.properties using grep / awk
echo "version? (Ex: 1.6.3)"
read version
cd release
scp ../README root@www.colar.net:/data/websites/apache/Perso/fantomide/README.txt
cp fantomide.app.tgz fantomide-$version.app.tgz 
cp fantomide.zip fantomide-$version.zip
scp fantomide-* root@www.colar.net:/data/websites/apache/Perso/fantomide

