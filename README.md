# solution
Infracloud assignment

# PART I


#### Create a private github repo "solution" and clone it into your local repo


$ git clone https://github.com/dipbhujbal/solution.git

$ cd solution


### Follow below steps on docker host to perform the assignment 
#### *NOTE : Here I have used docker play to perform the steps

#### Pull the required images 

$ docker pull infracloudio/csvserver:latest

$ docker pull prom/prometheus:v2.22.0

#### Verify that the images are uploaded 

$ docker images

#### Run the infracloudio/csvserver:latest in detached mode (background)

$ docker run -d infracloudio/csvserver:latest

7617b7f05cda2440d790138d282f762ec1f88c0ac98f9436fe46b06d1773516c

$ docker ps -a 

CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS                     PORTS     NAMES

7617b7f05cda   infracloudio/csvserver:latest   "/csvserver/csvserver"   11 seconds ago   Exited (1) 9 seconds ago             naughty_feiste


#### Find out the reason why the container exited using container logs 

$ docker logs 7617b7f05cda   

2022/05/26 14:45:52 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

#### Write a bash script gencsv.sh to generate a file named inputFile :

$ vi gencsv.sh

#### Run the container again in the detached mode with the above generated file 

$ docker run -d  -v /root/inputFile.csv:/csvserver/inputdata infracloudio/csvserver:latest

ad8a7be3f02ec36d1b054c70bc067448653779b5226a20f83668a64dda08479c

#### See container is running

$ docker ps

CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS      NAMES

ad8a7be3f02e   infracloudio/csvserver:latest   "/csvserver/csvserver"   12 seconds ago   Up 11 seconds   9300/tcp   affectionate_raman

####  Get the shell access of the container 

$ docker exec -it ad8a bash

#### Execute below command inside the container to see the port on which application is listening o

[root@ad8a7be3f02e csvserver]# netstat -nlp|grep LISTEN

tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver   

####  Exit from the container 

####  Run the application again with port 9393 and env variable CSVSERVER_BORDER to Orange

$ docker run -d  -v /root/inputFile.csv:/csvserver/inputdata -p 9393:9300 --env CSVSERVER_BORDER=Orange infracloudio/csvserver:latest

eea6dd45fd73d7cf50b484f49f6c53cab0374572129179fa85f577d1b8aec595


####  Run the following command  to generate part-1-output file.

$ curl -o ./part-1-output http://192.168.0.28:9393/raw

####  Run the following command to generate part-1-logs file

$ docker logs eea6dd45fd73 >& part-1-logs


####  Remove the container

$ docker rm -f eea6

eea6


#### Get back to Git bash and Save PART I solution 


####  Create a file called "part-1-cmd" and save the command used to execute part 6 from PART I
$ vi part-1-cmd


####  Create a file part-1-logs  

$ vi part-1-logs

#### Commit and save your changes of PART I solution on GITHUB


# PART II


#### Create docker-compose.yaml file and edit the file with required configurations

$ vi docker-compose.yaml


#### Run the application using docker-compose up

$ docker-compose up -d

Starting root_csv_server_1 ... done

#### Verify the application is running 
$ docker ps 

CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS          PORTS                    NAMES

b511f51f2734   infracloudio/csvserver:latest   "/csvserver/csvserver"   4 minutes ago   Up 10 seconds   0.0.0.0:9393->9300/tcp   root_csv_server_1


#### Save the solution on Github


#### Save the solution of PART II 





# PART III

#### Delete any running container

$ docker rm -f b511f

b511f


#### Create prometheus.yaml file to configure prometheus to scrape data from our application at <application>:<port>/metrics endpoint
  
$ vi prometheus.yaml


#### Update the docker-compose file 

$ vi docker-compose.yaml


#### Run the container 
  
$ docker-compose up -d
  
Creating root_csv_server_1 ... done
  
Creating root_prometheus_1 ... done

#### Verify the application is running
  
$ docker ps
  
CONTAINER ID   IMAGE                           COMMAND                  CREATED         STATUS         PORTS                    NAMES
  
44a990b915ac   prom/prometheus:v2.22.0         "/bin/prometheus --c…"   5 minutes ago   Up 5 minutes   0.0.0.0:9090->9090/tcp   root_prometheus_1
  
120da0be7d12   infracloudio/csvserver:latest   "/csvserver/csvserver"   5 minutes ago   Up 5 minutes   0.0.0.0:9393->9300/tcp   root_csv_server_1
  
  
#### Save part III solution on github





##### Make sure that Prometheus is accessible on port 9090 on the host.

##### Type "csvserver_records" in the query box of Prometheus. Click on Execute and then switch to the Graph tab. on the host.
It will show straight line graph with value 10

