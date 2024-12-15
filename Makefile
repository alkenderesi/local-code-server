# Container configuration
IMAGE_NAME := codercom/code-server:latest
CONTAINER_NAME := local-code-server
PROJECTS_DIR := /home/coder/projects
PORT := 8080

# Mark .PHONY targets
.PHONY: help run stop clean

# Set default target
.DEFAULT_GOAL := help

# Help with available targets
help:
	@echo Available targets:
	@echo run    - Start the container
	@echo stop   - Stop the running container
	@echo clean  - Remove the container and the image

# Start the container
run:
	@echo Starting container $(CONTAINER_NAME)...
	docker start $(CONTAINER_NAME) || docker run \
		--detach \
		--name=$(CONTAINER_NAME) \
		--volume=$(CONTAINER_NAME):$(PROJECTS_DIR) \
		--workdir=$(PROJECTS_DIR) \
		--publish=$(PORT):$(PORT) \
		--expose=$(PORT) \
		--gpus=all \
		$(IMAGE_NAME) \
		code-server \
		--auth=none \
		--port=$(PORT)
	@echo $(CONTAINER_NAME) is running
	@echo Service available at: 127.0.0.1:$(PORT)

# Stop the running container
stop:
	@echo Stopping container $(CONTAINER_NAME)...
	docker stop $(CONTAINER_NAME)

# Clean up resources
clean:
	@echo Cleaning up...
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)
	-docker rmi $(IMAGE_NAME)
