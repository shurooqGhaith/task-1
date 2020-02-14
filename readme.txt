Task #1 steps:

1-Write a cronjob to be executed every hour to collect data about system utilization.
         00 * * * * script.sh
     

2-Collect disk usage and free disk, memory used and free memory, and cpu utilization using these commands :
          df -lh m free -m , mpstat -P ALL 
then store each output into a separate file with timestamp .

3- Compute the average of used & free disk , used memory , used & free cpu every hour.
for example : to compute the avg of used disk storage use this command . 

           df |awk '{print $3}'|sed '1d'|awk '{total+=$1;count++} END {print total/count}' >> /disk_avg 
		   awk command to extract a specific culomn from an output then compute the total of values for this culomn
           and calculate the avg.		   

4-append those avgs onto files. 
5-compute the avg for all these stored avgs then store them in html pages.
   to compute the cpu usage average use this:
   
   awk '{ total += $1 } END { print total/NR }' /cpu_avg >> /var/www/html/cpu.html
   where /cpu_avg is a file contain the avgs computed each hour


6-Display the avgs of CPU Usage,Memory Usage,Disk Usage in links in an html page.
