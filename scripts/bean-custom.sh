command=$(echo "$@")
echo "Running $command in container"

docker run --rm -v $PWD/../../data:/bean -e BEANCOUNT_FILE=/bean/ledger.bean --name beancount -it beans $command
