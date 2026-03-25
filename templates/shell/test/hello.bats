#!/usr/bin/env bats

@test "prints default greeting" {
  run ./scripts/hello
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, world!" ]
}

@test "prints custom greeting" {
  run ./scripts/hello Alice
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Alice!" ]
}
