# Provides various bash helpers

# Will exit script if we would use an uninitialised variable:
set -o nounset

# Will exit script when a simple command (not a control structure) fails:
set -o errexit

# abort message ...
#
# Abort and writes the message in red to standard error
#
function abort() {
  local red=$(tput setaf 1)
  local reset=$(tput sgr0)
  echo >&2 -e "${red}$@${reset}"
  exit 1
}

# abort_if_command_missing ...
#
# Aborts the given command is missing
#
function die_if_missing_command() {
local cmd=$1
  type ${cmd} >/dev/null 2>&1 || die "${*}"
}

# echo_info message ...
#
# Writes the message in bold to standard out
#
function echo_info() {
  local bold=$(tput bold)
  local reset=$(tput sgr0)
  echo -e "${bold}$@${reset}"
}

# echo_warn message ...
#
# Writes the message in yellow to standard out
#
function echo_warn() {
  local red=$(tput setaf 1)
  local reset=$(tput sgr0)
  echo -e "${red}$@${reset}"
}
