command=$(echo "$@ /bean/ledger.bean")
echo "Running $command in container"

docker run --rm -p 8080:8080 -v  $PWD/../../data:/bean -e BEANCOUNT_FILE=/bean/ledger.bean --name beancount -it beans $command