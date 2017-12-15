set __ssh_ident_fish_bin ~/.config/fisherman/ssh-ident/ssh-ident

function create_symlink
    if not test -L $HOME/bin/$argv
        echo "ln -s $__ssh_ident_fish_bin $HOME/bin/$argv"
        ln -s $__ssh_ident_fish_bin $HOME/bin/$argv
    end
end

function create_home_bin
    [ ! -d $HOME/bin ]; and mkdir -p $HOME/bin
end

function set_path
    if not contains $HOME/bin $fish_user_paths
        set -U fish_user_paths $HOME/bin $fish_user_paths
    end
end

if status --is-login
    create_home_bin
    set_path
    create_symlink ssh
    create_symlink scp
    create_symlink sftp
end
