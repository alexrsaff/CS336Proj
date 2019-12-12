cd ./pages
jar -cvf ../apache-tomcat-9.0.27/webapps/project.war *
cd ../
./apache-tomcat-9.0.27/bin/startup.sh
