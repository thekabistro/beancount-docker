echo "View website on http://localhost:5001"
docker run --rm -p 5001:5000 -v $PWD/../../data:/bean -e BEANCOUNT_FILE=/bean/ledger.bean --name beancount-fava -it beans