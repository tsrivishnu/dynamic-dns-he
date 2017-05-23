#!/bin/bash

HE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $HE_DIR/config
touch $DYDNS_LOG_FILE

actualsize=$(wc -c <"$DYDNS_LOG_FILE")
if [ $actualsize -ge $LOG_MAX_SIZE ]; then
    tail -n 100 $DYDNS_LOG_FILE > $DYDNS_LOG_FILE.tmp
    cat $DYDNS_LOG_FILE.tmp > $DYDNS_LOG_FILE
    rm $DYDNS_LOG_FILE.tmp
fi

echo "" >> $DYDNS_LOG_FILE
echo ">>>" >> $DYDNS_LOG_FILE
TZ='UTC' date >> $DYDNS_LOG_FILE

curl -k -4 "https://$HE_DOMAIN:$HE_PASS@dyn.dns.he.net/nic/update?hostname=$HE_DOMAIN" >> $DYDNS_LOG_FILE
