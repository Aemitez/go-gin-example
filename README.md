# Go Gin Swagger API with Docker

This project demonstrates how to build a RESTful API using **Go**, **Gin**, and **Gin Swagger** for automatic API documentation, all encapsulated in a Docker container.

## Features
- **Gin**: Web framework for building RESTful APIs in Go.
- **Gin Swagger**: Automatically generates Swagger documentation for the API.
- **Docker**: To run the API inside a container for easy deployment and development.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- **Go 1.24.3+**
- **Docker** installed on your machine.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Aemitez/go-gin-example.git
cd go-gin-example

go mod tidy

docker buildx build --platform linux/amd64 -t go-gin-example .

docker run -p 8080:8080 go-gin-example

http://localhost:8080/swagger/index.html