# yandex-disk completion
# put this file in /etc/bash_completion.d/

have yandex-disk &&
_yadisk_complete()
{
    local cur prev opts commands
    
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    opts="--config --dir --auth --exclude-dirs --read-only --overwrite --no-daemon --version --keep-link --help --proxy"
    commands="start stop status sync token publish unpublish setup help --version --help"

    if [[ ${COMP_CWORD} == 1 ]]; then
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
        return 0
    fi
    
    local config2= auth= dirs=
    
    [[ $prev = '--dir' || $prev = '-d' ]] && dirs=1

    [[ $prev = '--config' || $prev = '-c' ]] && config=1
    [[ $prev = '--auth' || $prev = '-a' ]] && auth=1
    
    [[ $prev = '--exclude-dirs' ]] && dirs=1
    
    [[ $auth ]] && COMPREPLY=( $( compgen -o filenames -o nospace -- $cur ) )
    [[ $dirs ]] && COMPREPLY=( $( compgen -o dirnames -o nospace -- $cur ) )
    
    [[ ${cur} == -* ]] && COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
    [[ $COMPREPLY == *= ]] && compopt -o nospace
}

complete -F _yadisk_complete -X +o nospace yandex-disk
