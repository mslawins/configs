for file in $(find .)
do 
    if [ -f $file ]; then
        wc -l $file
    fi
done | sort -n
