package main

import (
	"flag"
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/haobird/goutils"
	"github.com/tidwall/gjson"
)

// 接收1400截图

type responseInfo struct {
	Code int         `json:"code"`
	Msg  string      `json:"message"`
	Data interface{} `json:"data"`
}

func respondWithInfo(code int, message string, data interface{}, c *gin.Context) {
	c.JSON(200, responseInfo{
		Code: code,
		Msg:  message,
		Data: data,
	})
	c.Abort()
}

var addr = flag.String("addr", "0.0.0.0:8085", "http service address")

func main() {
	InitHTTP()
}

func InitHTTP() {
	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()
	// 注册
	router.POST("/VIID/System/Register", func(c *gin.Context) {
		buf, err := c.GetRawData()
		if err != nil {
			fmt.Println("/VIID/System/Register error:", string(buf))
		}
		// var input map[string]interface{}
		// json.Unmarshal(buf, &input)
		// body := map[string]string{
		// 	"Id":           goutils.String(input["DeviceID"]),
		// 	"StatusString": "success",
		// 	"LocalTIme":    time.Now().String(),
		// }
		id := gjson.GetBytes(buf, "RegisterObject.DeviceID").String()
		curtime := goutils.GetNormalTimeString(time.Now())
		body := fmt.Sprintf(`{"ResponseStatus":{"Id":"%s","LocalTime":"%s","RequestURL":"/VIID/System/Register","StatusCode":0,"StatusString":"OK"}}`, id, curtime)

		fmt.Println("/VIID/System/Register result:", string(buf))
		respondWithInfo(200, "success", body, c)

	})

	// 保活
	router.POST("/VIID/System/Keepalive", func(c *gin.Context) {
		buf, err := c.GetRawData()
		if err != nil {
			fmt.Println("/VIID/System/Keepalive error:", string(buf))
		}
		fmt.Println("/VIID/System/Keepalive result:", string(buf))
		id := gjson.GetBytes(buf, "KeepaliveObject.DeviceID").String()
		curtime := goutils.GetNormalTimeString(time.Now())
		body := fmt.Sprintf(`{"ResponseStatus":{"Id":"%s","LocalTime":"%s","RequestURL":"/VIID/System/Keepalive","StatusCode":0,"StatusString":"OK"}}`, id, curtime)
		respondWithInfo(200, "success", body, c)

	})

	// 校时
	router.GET("/VIID/System/Time", func(c *gin.Context) {
		buf, err := c.GetRawData()
		if err != nil {
			fmt.Println("/VIID/System/Time error:", string(buf))
		}

		fmt.Println("/VIID/System/Time result:", string(buf))
		respondWithInfo(200, "success", nil, c)

	})

	router.POST("/VIID/Faces", func(c *gin.Context) {
		buf, err := c.GetRawData()
		if err != nil {
			fmt.Println("/VIID/Faces error:", string(buf))
		}

		fmt.Println("carguard result:", string(buf))
		respondWithInfo(200, "success", nil, c)

	})

	router.POST("/VIID/Images", func(c *gin.Context) {
		buf, err := c.GetRawData()
		if err != nil {
			fmt.Println("/VIID/Images error:", string(buf))
		}

		fmt.Println("carguard result:", string(buf))
		respondWithInfo(200, "success", nil, c)
	})

	router.POST("/VIID/Persons", func(c *gin.Context) {
		buf, err := c.GetRawData()
		if err != nil {
			fmt.Println("/VIID/Persons error:", string(buf))
		}

		fmt.Println("carguard result:", string(buf))
		respondWithInfo(200, "success", nil, c)
	})

	fmt.Println("http服务启动: ", *addr)
	router.Run(*addr)
}
