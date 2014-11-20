# Bash sugar

Provides various bash helper functions, ideal for new projects

## Provided Functions

### Handling errors

*  `abort message` - Abort and writes the message in red to standard error. Example:
  
    abort "error occured"

*  `abort_if_command_missing` - Aborts the given command is missing.
    Example:

    abort_if_command_missing "ping" "is missing"

*  `abort_if_file_missing` - Aborts if file is missing

    abort_if_file_missing "/usr/lib/bash_sugar" "is missing"

* `abort_if_env_missing` - Aborts if the environment variable is missing
    
    abort_if_env_missing  "BASH_SUBGAR_LIB" "is missing"

* `abort_if_not_root` - Aborts if the current user is not root
    
    abort_if_not_root "must be root to run ${0} command"

### Screen Output
* `echo_info` - Writes the message in bold to standard out
* `echo_warn` - Writes the message in yellow to standard out

## Using

Include this in your project

