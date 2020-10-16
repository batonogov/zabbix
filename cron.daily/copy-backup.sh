echo Копирую резервную копию в сеть
echo -ne '☭☭☭☭☭                   (33%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭           (66%)\r'
sleep 10
echo -ne '☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭☭ (100%)\r'
echo -ne '\n'

if [ -z "$cifs_share" ]
then
    echo "\$cifs_share is empty"
else
    mkdir /temp

    until mount -t cifs $cifs_share /temp -o user=$login,password=$password
    do
        date
        sleep 60 && echo Пробую снова
    done
    
    cd /backup/
    cp `ls -t | head -1` /temp

    umount /temp
    rmdir /temp
fi
