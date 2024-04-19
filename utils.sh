java_path="C:\\Program Files\\Java\\jdk-21\\"

## System commands
# pentru a pune comentariu apas "ctrl+/"
# pentru a cauta in jshell apas "ctrl+R"
# pentru a te duce la inceputul randului in jshell apas "ctrl+A"
# pentru a iesi din folder in jshell apas "ctrl+D" sau "ctrl+C"
# pentru a cauta prin cod "ctrl+shift+L"
# pentru a cauta "shift+shift"
# go to declaration or usage "ctrl+B"
# "ctrl + D" to copy the current line and paste it on the next line in intellij
# to format the code "ctrl+alt+L"


# "/save nameOfFile.txt" to save all the methods created
# "/methods" to see all the methods created
# "/edit nameOfMethod" to edit a method

# "ls" to see what is in a folder

## Print
System.out.printf("%d", 7) # to print decimals
System.out.printf("%s", "Testing") # to print string
System.out.printf("%f", 5.5) # to print float

## Variables types
# byte: -128 to 128
# short: -32,768 to 32,767
# int: -2,147,483,648 to 2,147,483,648
# long: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,808
#                float: 4.5f
#                double: 4.5
# char: 'A'
# boolean: true or false

# Daca vrem sa facem o operatie cu numere intregi cu acuratete mare:
BigDecimal number1 = new BigDecimal("34.56789876");

## Method Syntax
# ReturnType nameOfTheMethod(Type argumentName) {
#     //Body of the method
# }
# "void" - method daca nu vreau sa returneze nimic

## String and List: List<String>
String str = "Test"
str.charAt(0) # get the first character from the string
str.substring(2) # get only from the 2nd character and so on
str.substring(2,5) # get the characters from 2 inclusive to 5 exclusive
str.indexOf("es") # to search if some string is from str and returns the index of the "e"
str.lastIndexOf('t') # the last appearence of a letter in a string
str.contains("ext") #verify if a string contains such a substring : returns true or false
str. + tab = show all the operation available for str
StringBuffer sb = new StringBuffer("TEst"); # can change the initial string after operations
StringBuilder = sb = new StringBuilder("test"); # more rapid

# to remove from ArrayList
jshell> Iterator<String> iterator = wordsAl.iterator();
iterator ==> java.util.ArrayList$Itr@71318ec4

jshell> while (iterator.hasNext()) {
   ...>     if (iterator.next().endsWith("at")) {
   ...>         iterator.remove();
   ...>     }
   ...> }

@Component # GENERIC ANNOTATION APLICABLE FOR ANY CLASS
           #  An instance of class will be managed by Spring Framework . We put it at the begining of any java class
@ComponentScan("com.in20minutes") ## Spring Framework find component classes
@Bean ## We put it at the begining of a method
@Service # Indicates that an annotated class has business logic
@Controller # use to define controllers in web applications
@Repository # Indicates that an annotated class is used to retrieve and/or manipulate database

@PostConstruct # Indentifies the method that will be executed after dependency injection is done to perform any initialization
@PreDestroy # Indentifies the method that will receive the callback notification to signal that the instance is in the process of being removed by the container.
            # Typically used to release resources that it has been holding.
@Named # Similar to @Component

##  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

###  REACT
> set PORT=5100 && npm start  # to change the port

### To start the app
> npm start

### TYPESCRIPT
> tsc myhelloworld.ts   # compile a typescript code
> node myhelloworld.js  # run the js file

## Variable types
boolean # true/false
number # integer and floating points
string # Text data
any # Supports "any" datatype assignment

# To define a variable:
let <variableName>: <type> = <initial value>;

# The .js file is still generated even with compilation errors. To prevent this:
> tsc --noEmitOnError NameOfFile.ts

## To generate a typescript react application tamplate (navigate to the folder you want it to be created)
> npx create-react-app react-library --template typescript


################################ DOCKER ############################################
# To create a new directory run this in comand prompt
> mkdir name-of-directory

# To open folders in Visual Studio run thid in comand prompt
> code .
> idea .                  # open in intellij
> explorer.exe .          # open the current file in file explorer

# To build a docker image
> docker build -t hello-docker .     

# To run a file in comand prompt with docker
> docker run hello-docker
> docker run redis:4.0               # to run another version of redis
> docker run -d name_of_container sleep 1500   # to run the container in a detached mode (-d) for 1500 seconds
> docker attach  nr_of_container     # to run again in the foreground

# List containers
> docker ps                          # all running containers
> docker ps -a                       # is active  (running and not running)
> docker stop name_of_container      # to stop running a container
> docker rm name_of_container        # remove a container
> docker images                      # list all the images available
> docker rmi name_of_image           # to remove an image

# To see the image without run the container, just want to download the image
> docker pull name-of-image

# Run a docker container from ubuntu
> docker run ubuntu

#Run and enter the container 
> docker run -it name-of-image bash

# Run a container with the nginx:1.14-alpine image and name it webapp
> docker run --name webapp -d nginx:1.14-alpine

# Run an application on docker using different ports  -p (port) 
> docker run -p 80:5000 kodekloud/webapp

# Additional information about a container
> docker inspect name_of_container

# To see the logs of the application in the container 
> docker logs name_of_container

# Run an instance of kodekloud/simple-webapp with a tag blue and map port 8080 on the container to 8282 on the host.
> docker run -d -p 8282:8080 kodekloud/simple-webapp:blue

# To see what is in the Dockerfile of an application
> cat /the/way/to/the/application/Dockerfile

# To find something in a Dockerfile
> grep -i whatIWantToFind /the/way/to/the/application/Dockerfile

# Build a docker image using the Dockerfile and name it webapp-color. cd to the file where you want to build the image
> docker build -t webapp-color .

# To see in what directory you are now
> pwd

# To change something in a Dockerfile in the comand prompt 
> nano Dockerfile


### Docker engine
> docker -H=remote-docker-engine:port run nginx #(2375)

# List all the processes running on a container
> docker exec container-id ps -eaf


### Volumes
> docker volume create data_volume
> docker run -v datad_volume:/var/lib/mysql mysql
> docker run -v /data/mysql:/var/lib/mysql mysql
# we can rewrite this 
> docker run --mount type=bind, source=/data/mysql, target=/var/lib/mysql mysql


# To see the memory alocation fot docker 
> docker system df 
#To see the memory alocation to every image/container
> docker system df -v


### Network
# To run a ntwork
> docker run Ubuntu --network=none # or host

# To explore the networks
> docker network ls

# To find the ID associated to a network
> docker network inspect name-of-network
 
# To inspect network
> docker inspect name_of_network

### Container Orchestration
# If one localhost fail there is another running
> docker service create --replicas=100 nodejs
> kubectl run --replicas=1000 my-web-server
# do the same automatically
> kubectl scale --replicas=2000 my-web-server
# roll back the images that cruched
> kubectl rolling-update my-web-server --image=web-server:2

# Deploy an application on the cluster
> kubectl run hello-minikube

# View information about the cluster 
> kubectl cluster-info

# List all the nodes of a cluster
> kubectl get nodes

# docker compose up
docker-compose up -d
docker-compose down
docker-compose up -d --build




###################################### LINUX ##########################################################
## CTRL + ALT + T           -   to open the terminal
# List Storage
> ls
> ls /                 # file system at the very beginning of hard drive
> ls -l /              # to see more details or
> ll
> ls -a                # more information

# CTRL + L to clear the screen or
> clear

# Create a New File or update it if it already exists
> touch testfile.txt

# Text editor
> nano

# Know if a command exists
> which nano

# To install vim (another editor)
> sudo apt install vim-nox

# To copy files
> cp nameOfFile.txt nameOfTheNewFIle.txt
# To remove files
> rm nameOfFile.txt
# To remove a package
> sudo apt remove apache2
# remove other packages installed with apache2 after remove it
> sudo apt autoremove
# To move the files to a directory (and to rename files, just put instead of name directory the new file name)
> mv nameOfFile.txt nameOfDirectory

# To see if the files are different
> diff newfile.txt test2.txt

## To customize the terminal   (add a shortcut)
> cd ~/.bashrc
> nano ~/.bashrc
> alias c='clear'
> source ~/.bashrc
# To remove an alias
> unalias nameOfAlias

## To create a file to be executed (in the file write the comand you want to execute)
# if put "-x" the execution is denied (r is for read, w is for write)
> chmod +x myscript.sh

# Check resource usage (add -m to see in megabites)
> free
# Check disck space
> df -h

# TO SEE THE MEMORY USAGE
> htop

# Update repositories
> sudo apt update
> sudo apt upgrade                        # update the package that do not have to install or remove other packages
> sudo apt dist-upgrade                   # upgrade the rest that was not upgraded by the previous comand

# Search packages available
> apt search firefox

# To reboot the terminal (after you make some changes)
> sudo reboot

# To view logs (sudo in the beginning if doesn't work)
> cat /var/log/syslog
> journalctl -u ssh

# To see the users on the system
> cat /etc/passwd
# Criptated passowrds
> cat /etc/shadow
# Repeat the most recent command
> sudo !!

# Add a new user
> sudo adduser nameOfTheNewUser
# Switch to another user
> su - nameOfTheUser
# Logout
> logout
# Change password
> passwd
# To go to root
> sudo su -
# Remove a user (and all the files from the user)
> sudo userdel -r nameOfTheUser