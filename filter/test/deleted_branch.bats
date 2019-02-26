#!/usr/bin/env bats

load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/deleted_branch.json"

@test "deleted_branch: matches" {
  run deleted_branch feature-*
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "deleted_branch: does not match" {
  run deleted_branch release-*
  [ "$status" -eq 78 ]
  [ "$output" = "deleted_branch does not match" ]
}
