PRICE=$(curl --silent "https://api.coindesk.com/v1/bpi/currentprice.json" | jq .bpi.USD.rate_float)

printf "%0.2f \n" $PRICE
