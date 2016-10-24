GATEWAY=$(ip route| grep default |sed -n 's/.*via \([^ ]*\).*/\1/p')

MAX_LAT=0 AVR_LAT=0 PING_TOTAL=0

while true
do 
  latency=$(ping -c 1 192.168.1.1|grep time=|sed -n 's/.*time=\([^ ]*\).*/\1/p')
  if [ $latency ]
  then
    PING_TOTAL=$(bc <<< "$PING_TOTAL + 1")
    AVR_LAT=$(bc -l <<< "scale=2;(($AVR_LAT*($PING_TOTAL - 1))+$latency)/$PING_TOTAL")
    if [ $(bc -l <<< "$latency > $MAX_LAT") -gt 0 ]
    then 
      MAX_LAT=$latency
      printf "Maximum latency so far is %s, Average is %s\n" $MAX_LAT $AVR_LAT
    elif [ $[$PING_TOTAL%2] -gt 0 ] 
    then 
      printf "Maximum latency so far is %s, Average is %s\n" $MAX_LAT $AVR_LAT
    fi
  fi
  sleep 2
done


MAX_LAT=0 AVR_LAT=0 PING_TOTAL=0; while :; do latency=$(ping -c 1 192.168.1.1|grep time=| sed -n 's/.*time=\([^ ]*\).*/\1/p'); if [ $latency ]; PING_TOTAL=$(bc <<< "$PING_TOTAL + 1"); AVR_LAT=$(bc <<< "(($AVR_LAT*$PING_TOTAL)+$latency)/$PING_TOTAL"); then if [ $(bc <<< "$latency > $MAX_LAT") -gt 0 ]; then MAX_LAT=$latency; printf "Maximum latency so far is %s, Average is %s\n" $MAX_LAT

