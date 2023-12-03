# Part 1:
	
-	 The purpose of this part of the project is to create a container image to host my website on. The container ensures that
-	 the website can be consistently built and run automatically on different machines, as well as giving a degree of privacy. 

-	 Building and Running Dockerfile
- I used the commands, "sudo apt install docker", "sudo apt install podman", and "sudo apt install docker.io" to
-	 install the actual docker package onto my instance, and the podman dependency to be able to interact and run 
-	 container images. Docker.io is the version of docker created for ubuntu instances, so I had to install that as well
-	 For my dockerfile, I chose to use nginx for my webserver, and I copied the html file contents into the docker images's
-	 directory. I also made sure to set global configurations on and to not allow the image to run in the background.

-	 Once I configured the dockerfile, I use the command "sudo docker build -t newimage ." to build the Dockerfile in my
-	 current directory and name it newimage. To check that the build was successful, I could use the command
-	 "sudo docker images" to see if it is listed there. I ran the webpage by using "sudo docker run" with the specifications 
-	 to use Port 80, as well as allowing the container to run in the background. I could check that the webserver was running
-	 with sudo docker ps, and the image should be on there, along with its generated name. To actually get to the webserver, 
-	 I used the elastic IP of my AWS instance as the host IP along with the port 8080. 

# Part 2: 
-	DockerHub:
  	-	To create the Dockerhub repository, I went to the repository tab in the top menu, then clicked on the 
	-	"Create Repository" button. I named it project4, and chose to make it a public repository, since I would be 
	-	pushing images remotely. 

-	Pushing Images with Ubuntu
	-	To push the image to my repository on DockerHub, I first used the command "sudo docker login", and it asked me
	-	to enter my username and password. I used the container that I had built as the argument for the "sudo docker 
	-	commit" command and used "sudo docker push w267bxh/project4" to push the image.
-	Link to Repository: https://hub.docker.com/repository/docker/w267bxh/project4/general
	
-	Github Workflow
	-	Creating Github repository secrets lets you use reference specific text as arguments when configuring
	-	the workflow file; you can create them by navigating to the actions tab in the repository settings. 
	-	I made a secret to reference my DockerHub username and one for my password.
		
	-	Github workflow works as a method to automate processes of pushing or pulling files to other locations and
	-	it is configured through the use of a .yml file. What makes it especially useful is its reusability, as only 
	-	small changes may need to be made once the main functions are established.
	-	I used the Github secrets I set up earlier to login into my DockerHub account, so these would need to be changed 
	-	on an individual basis to work for different accounts.  
