# Docker Image for IBM Java Runtime Engine

This docker image will create a base container including the IBM JRE as a basis for other containers.

## Dependencies

- `debian` base docker image from Docker Hub.
- Download the IBM JRE of your intended version and extract to the `artifacts` directory.

## Build the docker image

    docker build -t stackinabox/ibm-java:%version% .
    
## Use the docker image from your own Dockerfile

	FROM stackinabox/ibm-java:%version%
	...

	CMD ["/bin/bash"]
	
## Launch the container (will exit, but responds to Java command line options)

     docker run stackinabox/ibm-java:%version%
	
## Supported Environment Variables

     JAVA_HOME: Path to Java Home Directory
 
