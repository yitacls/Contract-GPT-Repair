function lockBalanceChanges() {
    if (tx.origin==devAddress) {   // fault line
       balanceImportsComplete=true;
   }
}