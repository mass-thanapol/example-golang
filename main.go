package main

import (
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()
	app.Get("/home", func(c *fiber.Ctx) error {
		response := fiber.Map{
			"result": "success",
		}
		return c.JSON(response)
	})
	err := app.Listen(":5000")
	if err != nil {
		panic(err)
	}
}
