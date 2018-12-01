1) ./kafka-console-producer.sh —broker-list hadoop:9092 —topic project_topic
	Run kafka producer shell script.

2) ./kafka-console-consumer.sh —zookeeper hadoop000:2181 —topic project_topic
	Run kafka consumer shell script.

3) ./logstash -f project.conf
   Run logstash configuration file to collect data from access.log file and save in the kafka topic.

4) python msg.py
   Run python shell to produce simulative data and output to the access.log file.
	Tips: you may need to create a new access.log file and copy the access.log file 
	address to the corresponding msg.py file.
 
5) Run "Storm" application in 'code' folder.

6) Run "Web" Program in 'code' folder.
