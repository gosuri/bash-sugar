# Bash sugar

Provides various bash helper functions, ideal for new projects

## Provided Functions

### Handling errors

*  `abort message` - Abort and writes the message in red to standard error
  
        $ abort "error occured"

*  `abort_if_command_missing` - Aborts the given command is missing.

        $ abort_if_command_missing "ping" "is missing"

*  `abort_if_file_missing` - Aborts if file is missing

        $ abort_if_file_missing "/usr/lib/bash_sugar" "is missing"

* `abort_if_var_missing` - Aborts if the environment variable is missing
    
        $ abort_if_env_missing $BASH_SUBGAR_LIB "is missing"

* `abort_if_not_root` - Aborts if the current user is not root
    
        $ abort_if_not_root "must be root to run ${0} command"

### Screen Output

* `echo_info` - Writes the message in bold to standard out

        $ echo_info "This if for your information"

* `echo_warn` - Writes the message in yellow to standard out

        $ echo_warn "This is a warning"

## Usage

Download and include this in your script as a header file, you could place it in your lib directory

    curl -O https://raw.githubusercontent.com/gosuri/bash-sugar/master/bash-sugar.sh > lib/bash-sugar.sh

Include in your bash file

    BASH_SUGAR_LIB="lib/bash-sugar.sh"

    if [[ ! -f "${BASH_SUGAR_LIB}" ]]; then
      echo "Required file does not exist: ${BASH_SUGAR_LIB}"
      exit 2
    fi

    source "${BASH_SUGAR_LIB}" 
    bash_sugar_init || exit 2

    # Your actual script starts here.
    echo_info "using bash sugar"

## Development

### Running tests

Install (bats)[https://github.com/sstephenson/bats]

    bats test/bash-sugar.sh
