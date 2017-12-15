set __ssh_ident_fish_bin ~/.config/fisherman/ssh-ident/ssh-ident

[ ! -d $HOME/bin ]; and mkdir -p $HOME/bin
if not contains $HOME/bin $fish_user_paths
    set -U fish_user_paths $HOME/bin $fish_user_paths
end

function create_symlink
    if not test -L $HOME/bin/$argv
    echo "ln -s $__ssh_ident_fish_bin $HOME/bin/$argv"
        ln -s $__ssh_ident_fish_bin  $HOME/bin/$argv
    end
end

create_symlink ssh
create_symlink scp
create_symlink sftp
