package main

import (
	_ "go-gin-example/docs" // import the docs package for swagger documentation

	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files" // swagger embed files
	swagger "github.com/swaggo/gin-swagger"
)

// @Summary Get a greeting message
// @Description Get a simple greeting message
// @ID get-greeting
// @Produce json
// @Success 200 {string} string "Hello, World!"
// @Router /greet [get]
func getGreeting(c *gin.Context) {
	c.JSON(200, gin.H{"message": "Hello, World!"})
}

func main() {
	r := gin.Default()

	// Serve Swagger API documentation
	r.GET("/swagger/*any", swagger.WrapHandler(swaggerFiles.Handler))

	// Define API endpoint
	r.GET("/greet", getGreeting)

	r.Run(":8080")
}
