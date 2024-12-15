# local-code-server

This project sets up a local development container using the `codercom/code-server` image. It provides a web-based IDE accessible at `127.0.0.1:8080`.

* https://github.com/coder/code-server
* https://coder.com/docs/code-server/install#docker

## Prerequisites

- Docker (with WSL 2 for Windows users)
- Make

## Usage

- `make run`: Start the container
- `make stop`: Stop the container
- `make clean`: Remove the container and image

## Configuration

Customize the Makefile:
- `CONTAINER_NAME`: Name of the container instance
- `PROJECTS_DIR`: Path to your projects directory
- `PORT`: Port to access the IDE

> Note: After changing any of these, you may have to run `make clean` for changes to take effect before running `make run` again.

Windows users can adjust memory and CPU limits in `.wslconfig`.

## Accessing the IDE

After running `make run`, open a web browser and navigate to `http://127.0.0.1:8080`.
