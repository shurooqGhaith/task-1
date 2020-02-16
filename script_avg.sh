
#/bin/bash



echo >> /var/www/html/cpu.html
uptime >> /var/www/html/cpu.html
echo ":" >>  /var/www/html/cpu.html
awk '{ total += $1 } END { print total/NR }' /cpu_avg >> /var/www/html/cpu.html
echo >>  /var/www/html/cpu.html

echo >> /var/www/html/cpu_used.html
uptime >> /var/www/html/cpu_used.html
echo ":" >> /var/www/html/cpu_used.html
awk '{ total +=(100-$1) } END { print total/NR }' /cpu_avg >> /var/www/html/cpu_used.html
echo >> /var/www/html/cpu_used.html

echo >> /var/www/html/memory_avg.html
uptime >> /var/www/html/memory_avg.html
echo ":" >> /var/www/html/memory_avg.html
awk '{ total += $1 } END { print total/NR }' /mem_avg >> /var/www/html/memory_avg.html


echo >> /var/www/html/disk_av.html
uptime >> /var/www/html/disk_av.html
echo ":" >> /var/www/html/disk_av.html
awk '{ total += $1 } END { print total/NR }' /disk_avg_av >> /var/www/html/disk_av.html


echo >> /var/www/html/disk.html
uptime >> /var/www/html/disk.html
echo ":" >> /var/www/html/disk.html
awk '{ total += $1 } END { print total/NR }' /disk_avg >> /var/www/html/disk.html





echo -n "" > /disk_out
echo -n "" > /mem_out
echo -n "" > /cpu_out

echo -n "" > /disk_avg
echo -n "" > /disk_avg_av
echo -n "" > /mem_avg
echo -n "" > /cpu_avg
echo -n "" > /cpu_used





