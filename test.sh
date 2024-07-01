val=5
sign=1

while [ true ]
do
    if [ $val -eq 10 ]
    then
        sign=-1
    fi
    if [ $val -eq 0 ]
    then
        sign=1
    fi
    val2=$(($val + 1))
    val3=$(($val + 3))
    curl -d $val -H "Content-Type: application/json" -X POST 'http://10.75.69.66:8082/Temperature/addValue/59f5d537-c4bb-4e15-b9fd-7f84befdb3f0'
    echo "\n"
    curl -d $val2 -H "Content-Type: application/json" -X POST 'http://10.75.69.66:8084/Humidity/addValue/fb7459fa-9545-45b9-91d9-582dc08958bd'
    echo "\n"
    curl -d $val3 -H "Content-Type: application/json" -X POST 'http://10.75.69.66:8081/Luminosity/addValue/a394f10b-9bfc-42c0-a5c0-782ee13cab5d'
    echo "\n"
    echo "-----------"
    val=$(($val + ( 1 * $sign )))
    sleep 1
done
