# gc参数

两种jc配置:

1. cms+parnew

-Djava.awt.headless=true
-Xmx1g
-Xss2048k
-XX:+UseParNewGC
-XX:+UseConcMarkSweepGC  
-XX:CMSInitiatingOccupancyFraction=75
-XX:+UseCMSInitiatingOccupancyOnly
-XX:+HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=/opt/logstash/heapdump.hprof

2. g1

-server -Xms512m -Xmx2g -Xss256k -XX:+UseG1GC -XX:OnOutOfMemoryError=kill -9 %p
