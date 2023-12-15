# Part 1:

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


- WebHooks 
	 
