package greeting

import "testing"

func TestNew(t *testing.T) {
	got := New("Go")
	want := "Hello, Go!"

	if got.Message != want {
		t.Fatalf("got %q, want %q", got.Message, want)
	}
}

func BenchmarkNew(b *testing.B) {
	for b.Loop() {
		_ = New("benchmark")
	}
}

func FuzzNew(f *testing.F) {
	f.Add("world")
	f.Add("Go")

	f.Fuzz(func(t *testing.T, name string) {
		got := New(name)
		if got.Message == "" {
			t.Fatal("empty greeting")
		}
	})
}
