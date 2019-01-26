#!/usr/bin/env zsh

setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' formats "%r/%S" "[%b]" "%u%c"
zstyle ':vcs_info:*:*' actionformats "%r/%S" "[%b](%a)" "%u%c"

INFOLINE_START="%f%F{blue}%m:%F{white}"
INFOLINE_END="%f"

function check_repo() {
    # Check if we're in an Repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # Show Repository in Infoline
    vcs_info
    INFOLINE="${vcs_info_msg_0_%%/.}"

    # Check if Repo is dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null
    if [ $? -eq 0 ]; then
        INFOLINE="$INFOLINE%F{green}"
    else
        INFOLINE="$INFOLINE%F{red}"
    fi

    # Show Branch name
    INFOLINE="$INFOLINE ${vcs_info_msg_1_}"

    # Check if we have untracked changes
    command git status --porcelain | grep '??' &>/dev/null
    if [ $? -eq 0 ]; then
        INFOLINE="$INFOLINE %F{red}+"
    fi
}

function cmd_exec_time() {
    local stop=`date +%s`
    local start=${cmd_timestamp:-$stop}
    let local elapsed=$stop-$start
    [ $elapsed -gt 5 ] && echo " %F{yellow}${elapsed}s"
}

function preexec() {
    cmd_timestamp=`date +%s`
}

function precmd() {
    INFOLINE="%~"
    check_repo
    print -P "\n$INFOLINE_START$INFOLINE$(cmd_exec_time)$INFOLINE_END"
}

PROMPT="%(?.%F{magenta}.%F{red})>>>%f "
