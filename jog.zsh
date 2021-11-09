# -*- sh -*-

# [Jog](https://github.com/natethinks/jog)
#   Print the last 10 commands you ran in the current directory
# [zaw](https://github.com/zsh-users/zaw)
#   zsh anything.el-like widget

function zaw-src-jog() {
    candidates=("${(ps:\n:)$(jog | sed '1!G;h;$!d')}")
    actions=("zaw-callback-execute" "zaw-callback-replace-buffer" "zaw-callback-append-to-buffer")
    act_descriptions=("execute" "replace edit buffer" "append to edit buffer")
}

function zaw-callback-jog-append-to-buffer() {
    zle accept-and-hold; echo a
}

zaw-register-src -n jog zaw-src-jog
