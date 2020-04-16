PRICE=$(curl --silent "https://api.cryptowat.ch/markets/bitmex/btcusd-perpetual-futures/price" | jq ".result.price")
printf "%.2f \n" "$PRICE"
