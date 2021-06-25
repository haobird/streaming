
	  if [ -f "shutdown.sh" ];then
    ./shutdown.sh
    fi
    nohup ./app > debug.log 2>&1 &
  