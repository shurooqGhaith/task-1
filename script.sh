#/bin/bash

#cpu usage 
echo >> /cpu_out
uptime >> /cpu_out 
echo "CPU Usage" >> /cpu_out 
mpstat -P ALL >> /cpu_out 


#memory usage
echo >>/mem_out  
uptime >> /mem_out 
echo "Memory usage" >> /mem_out 
free -m >> /mem_out 

#disk usage
echo >> /disk_out
uptime >> /disk_out 
echo "disk usage" >> /disk_out 
df -lh >> /disk_out
 

#avg of used and available disk
df |awk '{print $3}'|sed '1d'|awk '{total+=$1;count++} END {print total/count}' >> /disk_avg
df |awk '{print $4}'|sed '1d'|awk '{total+=$1;count++} END {print total/count}' >> /disk_avg_av

#avg of used and used memory
free -m |awk '{print $3}'|sed '1d'|awk '{total+=$1;count++} END {print total/(count)}' >> /mem_avg

#avg of idle cpu
mpstat -P ALL |grep -i "all" | tr -s ' ' |cut -d ' ' -f 13 >> /cpu_avg



echo > /var/www/html/cpu.html
echo "CPU average :" >> /var/www/html/cpu.html
awk '{ total += $1 } END { print total/NR }' /cpu_avg >> /var/www/html/cpu.html



echo > /var/www/html/cpu_used.html
echo "CPU average :" >> /var/www/html/cpu_used.html
awk '{ total +=(100-$1) } END { print total/NR }' /cpu_avg >> /var/www/html/cpu_used.html


echo > /var/www/html/memory_avg.html
echo "memory usage average :" >> /var/www/html/memory_avg.html
awk '{ total += $1 } END { print total/NR }' /mem_avg >> /var/www/html/memory_avg.html

echo > /var/www/html/disk_av.html
echo "Available Disk average :" >> /var/www/html/disk_av.html
awk '{ total += $1 } END { print total/NR }' /disk_avg_av >> /var/www/html/disk_av.html


echo > /var/www/html/disk.html
echo "used disk average :" >> /var/www/html/disk.html
awk '{ total += $1 } END { print total/NR }' /disk_avg >> /var/www/html/disk.html




echo > /tmp/out2
echo "used disk average :" >> /tmp/out2
awk '{ total += $1 } END { print total/NR }' /disk_avg >> /tmp/out2


