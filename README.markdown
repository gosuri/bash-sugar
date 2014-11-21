# Bash sugar

Provides various bash helper functions, ideal for new projects

## Provided Functions

### Handling errors

*  `abort` - Abort and writes the message in red to standard error
  
        $ abort "error occured"

*  `abort_if_command_missing` - Aborts the given command is missing.

        $ abort_if_command_missing "ping" "is missing"

*  `abort_if_file_missing` - Aborts if file is missing

        $ abort_if_file_missing "/usr/lib/bash_sugar" "is missing"

* `abort_if_var_missing` - Aborts if the environment variable is missing
    
        $ abort_if_var_missing $BASH_SUBGAR_LIB "is missing"

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

### Note using `bash_sugar_init`

The init function sets `set -o errexit`. This tells bash that it should exit the script if any statement returns a non-true return value. The benefit of using -e is that it prevents errors snowballing into serious issues when they could have been caught earlier. Basically giving you error checking for free.
Unfortunately it means you can’t check $? as bash will never get to the checking code if it isn’t zero. There are other constructs you could use:
    
    command
    if [ "$?"-ne 0]; then echo "command failed"; exit 1; fi

could be replaced with
    
    command || { echo "command failed"; exit 1; }

or 
    if ! command; then echo "command failed"; exit 1; fi

What if you have a command that returns non-zero or you are not interested in its return value? You can use command || true, or if you have a longer section of code, you can turn off the error checking, but I recommend you use this sparingly.

    set +e
    command1
    command2
    set -e

On a slightly related note, by default bash takes the error status of the last item in a pipeline, which may not be what you want. For example, false | true will be considered to have succeeded. If you would like this to fail, then you can use `set -o pipefail` to make it fail.

## Development

### Running tests

Install [bats](https://github.com/sstephenson/bats)

    bats test/bash-sugar.sh
