set -U __ssh_ident_fish_bin $HOME/.config/fisherman/ssh-ident/ssh-ident
set -U __ssh_ident_fish_bin_path $HOME/bin

function log
    echo "[ssh-ident.fish]" $argv
end

log Set ssh-ident path: $__ssh_ident_fish_bin

function __ssh_ident_fish_create_symlink
    if not test -L $__ssh_ident_fish_bin_path/$argv
        ln -s $__ssh_ident_fish_bin $__ssh_ident_fish_bin_path/$argv
        log "Create symlink for $argv | $__ssh_ident_fish_bin_path/$argv -> $__ssh_ident_fish_bin"
    end
end

function __ssh_ident_fish_create_home_bin
    if [ ! -d $__ssh_ident_fish_bin_path ]
        mkdir -p $__ssh_ident_fish_bin_path
        log mkdir $__ssh_ident_fish_bin_path
    end
end

function __ssh_ident_fish_set_path
    if not contains $__ssh_ident_fish_bin_path $fish_user_paths
        set -U fish_user_paths $__ssh_ident_fish_bin_path $fish_user_paths
        log Update \$fish_user_paths to include $__ssh_ident_fish_bin_path
    end
end


__ssh_ident_fish_create_home_bin
__ssh_ident_fish_set_path
__ssh_ident_fish_create_symlink ssh
__ssh_ident_fish_create_symlink scp
__ssh_ident_fish_create_symlink sftp
