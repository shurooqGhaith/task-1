#/bin/bash
echo >> /cpu_out
mpstat -P ALL >> /cpu_out 

echo >>/mem_out  
free -m >> /mem_out 

echo >> /disk_out 
df -lh >> /disk_out

df |awk '{print $3}'|sed '1d'|awk '{total+=$1;count++} END {print total/count}' >> /disk_avg
df |awk '{print $4}'|sed '1d'|awk '{total+=$1;count++} END {print total/count}' >> /disk_avg_av

#avg of used and used memory
free -m |awk '{print $3}'|sed '1d'|awk '{total+=$1;count++} END {print total/(count)}' >> /mem_avg

#avg of idle cpu
mpstat -P ALL |grep -i "all" | tr -s ' ' |cut -d ' ' -f 13 >> /cpu_avg





