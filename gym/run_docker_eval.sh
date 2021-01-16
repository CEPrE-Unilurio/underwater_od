chmod 777 -Rf ai4coral

for item in $(ls ai4coral/models)
do
    if [ "$1" == "$item" ]; then
        nvidia-docker run -it -v $(pwd)/ai4coral:/home registry.fsoc.hpi.uni-potsdam.de/ai4coral eval.sh $1
        exit
    fi
done

echo 'there is no model named: ' $1

