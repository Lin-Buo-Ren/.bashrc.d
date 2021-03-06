# shellcheck shell=bash
# shellcheck disable=SC2034
# Setup dquilt for debian packaging
# Refer: https://www.debian.org/doc/manuals/maint-guide/modify.zh-tw.html
# 林博仁 © 2017

## Include Guard to prevent multiple sourcing
if [ -v DEBIAN_SETUP_DQUILT ]; then
	return 0
fi

# Don't bother if quilt is not available
if ! which quilt >/dev/null; then
	return 0
fi

alias dquilt='quilt --quiltrc=${HOME}/.quiltrc-dpkg'
complete -F _quilt_completion -o filenames dquilt

## Set Include Guard
declare DEBIAN_SETUP_DQUILT=1

## This script is based on the GNU Bash Shell Script Template project
## https://github.com/Lin-Buo-Ren/GNU-Bash-Shell-Script-Template
## and is based on the following version:
declare META_BASED_ON_GNU_BASH_SHELL_SCRIPT_TEMPLATE_VERSION="v1.24.2-3-g3ec093a-dirty"
## You may rebase your script to incorporate new features and fixes from the template