Part 1:
	
	The purpose of this part of the project is to create a container image to host my website on. The container ensures that
	the website can be consistently built and run automatically on different machines, as well as giving a degree of privacy. 

	Building and Running Dockerfile
	I used the commands, "sudo apt install docker", "sudo apt install podman", and "sudo apt install docker.io" to
	install the actual docker package onto my instance, and the docker-podman dependency to be able to interact and run 
	container images. Docker.io is the version of docker created for ubuntu instances, so I had to install that as well
	For my dockerfile, I chose to use nginx for my webserver, and I copied the html file contents into the docker images's
	directory. I also made sure to set global configurations on and to not allow the image to run in the background.

	Once I configured the dockerfile, I use the command "sudo docker build -t newimage ." to build the Dockerfile in my
	current directory and name it newimage. To check that the build was successful, I could use the command
	"sudo docker images" to see if it is listed there. I ran the webpage by using "sudo docker run" with the specifications 
	to use Port 80, as well as allowing the container to run in the background. I could check that the webserver was running
	with sudo docker ps, and the image should be on there, along with its generated name. To actually get to the webserver, 
	I used the elastic IP of my AWS instance as the host IP along with the port 8080. 
