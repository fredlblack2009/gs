#!/bin/bash
APP_MAIN=ct-data-3.1.0.RELEASE.jar
tradePortalPID=0  
   
getTradeProtalPID(){  
    javaps=`jps -l | grep $APP_MAIN`  
    if [ -n "$javaps" ]; then  
        tradePortalPID=`echo $javaps | awk '{print $1}'`  
    else  
        tradePortalPID=0  
    fi  
}

startup(){  
    getTradeProtalPID  
    echo "======================================================================================"  
    if [ $tradePortalPID -ne 0 ]; then  
        echo "$APP_MAIN already started(PID=$tradePortalPID)"  
        echo "======================================================================================"  
    else  
        echo -n "Starting $APP_MAIN"  
        nohup java -Xms2G -Xmx2G -XX:MetaspaceSize=512M -XX:MaxMetaspaceSize=512M -DLOG_LEVEL=warn -DLOG_PATH="./logs" -Dspring.profiles.active=product -jar $APP_MAIN > ./nohup.log &  
        getTradeProtalPID  
        if [ $tradePortalPID -ne 0 ]; then  
            echo "(PID=$tradePortalPID)...[Success]"  
            echo "======================================================================================"  
        else  
            echo "[Failed]"  
            echo "======================================================================================"  
        fi  
    fi  
}

shutdown(){  
    getTradeProtalPID  
    echo "======================================================================================"  
    if [ $tradePortalPID -ne 0 ]; then  
        echo -n "Stopping $APP_MAIN(PID=$tradePortalPID)..."  
        kill -9 $tradePortalPID  
        if [ $? -eq 0 ]; then  
            echo "[Success]"  
            echo "======================================================================================"  
        else  
            echo "[Failed]"  
            echo "======================================================================================"  
        fi  
        getTradeProtalPID  
        if [ $tradePortalPID -ne 0 ]; then  
            shutdown  
        fi  
    else  
        echo "$APP_MAIN is not running"  
        echo "======================================================================================"  
    fi  
}

status(){  
    getTradeProtalPID  
    echo "======================================================================================"  
    if [ $tradePortalPID -ne 0 ]; then  
        echo "$APP_MAIN is running(PID=$tradePortalPID)"  
        echo "======================================================================================"  
    else  
        echo "$APP_MAIN is not running"  
        echo "======================================================================================"  
    fi  
}

deploy(){
    shutdown
    startup
}

$1
