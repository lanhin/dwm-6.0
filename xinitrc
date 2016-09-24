#!/bin/sh 

# Default Fix My Board 
xmodmap /other/Backup/fix/xmodmap & 

# Base Env Var Setup 
X_ENV="dwm" 

# Open office fix 
export OOO_FORCE_DESKTOP=gnome 

# Input System 
export LANG=en_US.UTF-8
#export LC_CTYPE=zh_CN.UTF-8
export LC_ALL="en_US.UTF-8"
export XIM=fcitx 
export XIM_PROGRAM=fcitx 
export GTK_IM_MODULE=fcitx 
export XMODIFIERS="@im=fcitx" 
export QT_IM_MODULE=fcitx
fcitx -d 

# Wall Page 
feh --bg-center .wp.png & 

# dwm ENV 
if [ $X_ENV ]; then 
export AWT_TOOLKIT=MToolkit
fi

# Sound
start-pulseaudio-x11 &

# My Status Bar
while true ; do
    batt=$(acpi -b)
    case $batt in
        *Discharging*)
	    batt="<$(echo $batt | awk '{print $4}' | tr -d ',')"
            ;;
	*Charging*)
	    batt=">$(echo $batt | awk '{print $4}' | tr -d ',')"
	    ;;
        *)
	    batt="$(echo $batt | awk '{print $4}' | tr -d ',')"
            ;;
    esac

    ##echo user nice system idle iowait irq softirq  
    CPULOG_1=$(cat /proc/stat | grep 'cpu ' | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8}')  
    SYS_IDLE_1=$(echo $CPULOG_1 | awk '{print $4}')  
    Total_1=$(echo $CPULOG_1 | awk '{print $1+$2+$3+$4+$5+$6+$7}')

    sleep 3
    
    CPULOG_2=$(cat /proc/stat | grep 'cpu ' | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8}')  
    SYS_IDLE_2=$(echo $CPULOG_2 | awk '{print $4}')  
    Total_2=$(echo $CPULOG_2 | awk '{print $1+$2+$3+$4+$5+$6+$7}')  
 
    SYS_IDLE=`expr $SYS_IDLE_2 - $SYS_IDLE_1`  
 
    Total=`expr $Total_2 - $Total_1`  
    SYS_USAGE=`expr $SYS_IDLE/$Total*100 |bc -l`  
 
    SYS_Rate=`expr 100-$SYS_USAGE |bc -l`  
 
    Disp_SYS_Rate=`expr "scale=2; $SYS_Rate/1" |bc`

    xsetroot -name "$batt $( date +"%F %R" ) $Disp_SYS_Rate%"
    sleep 57
done &

exec dwm
