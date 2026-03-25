package main

import (
	"log/slog"
	"os"

	"example.com/my-project/internal/app"
)

func main() {
	logger := slog.New(slog.NewTextHandler(os.Stdout, nil))

	if err := app.Run(logger, os.Args[1:]); err != nil {
		logger.Error("application failed", "error", err)
		os.Exit(1)
	}
}
