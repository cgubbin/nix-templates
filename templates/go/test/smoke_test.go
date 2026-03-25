package test

import (
	"testing"

	"example.com/my-project/internal/greeting"
)

func TestSmoke(t *testing.T) {
	got := greeting.New("smoke")
	if got.Message != "Hello, smoke!" {
		t.Fatalf("unexpected greeting: %q", got.Message)
	}
}
