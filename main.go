package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	// 创建一个默认的Gin引擎
	r := gin.Default()

	// 定义一个GET请求的路由，路径为"/"
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello, World!",
		})
	})

	// 在本地的8080端口启动服务
	r.Run(":8080")
}
