package app

import (
	"errors"
	"flag"
	"fmt"
	"log/slog"

	"example.com/my-project/internal/greeting"
)

func Run(logger *slog.Logger, args []string) error {
	if len(args) == 0 {
		return runHello(logger, args)
	}

	switch args[0] {
	case "hello":
		return runHello(logger, args[1:])
	default:
		return errors.New("unknown command")
	}
}

func runHello(logger *slog.Logger, args []string) error {
	fs := flag.NewFlagSet("hello", flag.ContinueOnError)

	name := fs.String("name", "world", "name to greet")
	asJSON := fs.Bool("json", false, "emit JSON")

	if err := fs.Parse(args); err != nil {
		return err
	}

	msg := greeting.New(*name)

	if *asJSON {
		fmt.Printf("{\"message\":\"%s\"}\n", msg.Message)
		return nil
	}

	logger.Info("greeting", "message", msg.Message)
	fmt.Println(msg.Message)
	return nil
}
