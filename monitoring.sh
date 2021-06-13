
#!/bin/bash
echo -n "       #Architecture : " && uname -a
echo -n "       #CPU physical : " && nproc
echo -n "       #vCPU : " && cat /proc/cpuinfo | grep processor | wc -l
echo -n "       #Memory usage : " && free -t | grep Mem | awk '{printf("%d/%dMB (%d%%)\n", $2/1024, $3/1024, $3/$2*100)}'
echo -n "       #Disc Usage : " && df -h | grep root | awk '{printf("%d/%dGb (%s)\n", $3, $2, $5)}'
echo -n "       #CPU load : " && cat /proc/loadavg | awk '{printf("%.1f %%\n", ($1 + $2 + $3)/3)}'
echo -n "       #Last boot : " && who -b | awk '{print $3" "$4}'
echo -n "       #LVM use : " && t=$(cat /etc/fstab | grep '/mapper/' | wc -l) | if [ t ]; then echo "yes"; else echo "no"; fi
echo -n "       #Connexions TCP : " && ss -tu | grep 'tcp' | wc -l | awk '{print $1 " ESTABLISHED"}'
echo -n "       #User log : " && users | wc -w
echo -n "       #Network : IP "; ip=$(hostname -I); MAC=$(ifconfig -a | grep ether | awk '{print $2}'); echo -n $ip; echo -n " ("; echo -n $MAC; echo ")"
echo -n "       #Sudo : " && wc /var/log/sudo/sudo_logs | awk '{print $1" cmd"}'