package greeting

import "fmt"

type Greeting struct {
	Message string `json:"message"`
}

func New(name string) Greeting {
	return Greeting{
		Message: fmt.Sprintf("Hello, %s!", name),
	}
}
