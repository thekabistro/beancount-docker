command=$(echo "bean-web --public /bean/ledger.bean")
echo "Running $command in container"
echo "View website on http://localhost:8080"

docker run --rm -p 8080:8080 -v  $PWD/../../data:/bean -e BEANCOUNT_FILE=/bean/ledger.bean --name beancount -it beans $command


# assume you have example.bean in the current directory
#docker run -v $PWD:/bean -e BEANCOUNT_FILE=/bean/ledger.bean beans