# Part 1:

- Overview 

What I am doing in this project is using both tags and webhooks to streamline the process of a container. The GitHub workflow is 
configured so that whenever a new tag is pushed to the origin branch, it will build a container and then subsequently push that
image to the DockerHub repo. Assuming there is a webhook currently running, DockerHub will then send a message to the given URL, aand upon receiving that message, the webhook has instructions to execute a script that will restart and run a new image. This process significantly reduces the number of steps needed to distribute new versions of container images, and only requires a couple of steps once set up.

- Tags 

- The purpose of tags in a GitHub workflow is to mark important parts of the project, which can streamline the process to find 
which versions of the code are in a condition to be released. You can create tags via the 'create release' option on Github.com,
or with the git tag -a sampletagname command. Once the tag is created, it needs to be pushed to the current branch with the 
command 'git push origin sampletagname'

- Creating the workflow

Unlike the last project, where the .yml file was configured to turn on for any push, I am configuring the workflow to only turn 
on either manually, or when it receives a pull or push request from the origin branch with a tag starting in v. When I choose to
create a new version and push the tag to origin, the workflow will start and will start building the image. Using the docker 
metadata action grants access to the current tag information with the $ {{ steps.meta.outputs.tags }} variable, which will tag
the image being pushed with the new version number of the Github repo.

- [DockerHub Repo Link](https://hub.docker.com/repository/docker/w267bxh/project4/general)


# Part 2:

- I installed docker and its dependencies by the following commands: 'sudo apt install docker', 'sudo apt install docker.io' and 
'sudo apt install podman'.
- The bash script first stops and removes any images that are running based on the container, and then removes the most recent container image. It pulls and creates a new image based on the container with the restart specifications stating that whenever the container exits, it should be restarted unless it was manually exited. I kept the script in my home directory, but it would most likely go into the /etc/hook.conf folder for more ease of access.
- For the webhook, I chose to install it using apt, installing it with the command 'sudo apt-get webhook' and starting it with the 'sudo systemctl start webhook' command. 
- To actually make the webhook, I made a file called hooks.json and configured the webhook to have the address http://34.227.121.1:9000/hooks/webhook, which is the public IP address of the other EC2 instance I was using. I gave it the command to execute my bash script upon being listened to, and set its working directory to be '/var/webhook'. The webhook can be then put up with 'webhook -hooks hook.json -verbose' to grant more information about its processes. 
- I chose to use DockerHub for my messager, and gave it the url address of the webhook, which means it will send out a message to that address whenever I push a container to the repository. 
