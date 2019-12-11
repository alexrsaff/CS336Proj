REM Username first, then ppk location
pscp -i %2 ./apache-tomcat-9.0.27/webapps/project.war %1@ec2-18-224-96-185.us-east-2.compute.amazonaws.com:/home/%1/project.war
plink -ssh -t -i %2 %1@ec2-18-224-96-185.us-east-2.compute.amazonaws.com "sudo mv project.war /root/apache-tomcat-9.0.27/webapps/project.war && exit"