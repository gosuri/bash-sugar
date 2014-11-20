#!/usr/bin/env bats

source lib/bash-sugar.sh

@test "abort exit with status 1" {
  run abort 'abort'
  [ "$status" -eq 1 ]
}

@test "abort_if_missing_file exits 1 when a file is missing" {
  run abort_if_file_missing '/missing'
  [ "$status" -eq 1 ]
}

@test "echo_info exists with 0" {
  run echo_info "info"
  [ "$status" -eq 0 ]
}

@test "echo_warn exists with 0" {
  run echo_info "info"
  [ "$status" -eq 0 ]
}


@test "abort_if_env_missing exits 1 when environment variable is absent" {
  run abort_if_var_missing $TEST_ENV
  [ "$status" -eq 1 ]
}

@test "abort_if_var_missing exits 0 when environment variable is present" {
  TESTVAR='testing' 
  run abort_if_var_missing $TESTVAR, "missing"
  [ "$status" -eq 0 ]
}
