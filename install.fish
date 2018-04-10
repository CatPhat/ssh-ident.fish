set -U __sif_ssh_ident_bin_path $HOME/.config/fisherman/ssh-ident/ssh-ident
set -U __sif_home_bin_path  $HOME/bin
set -U __sif_bins ssh sftp

function log
    echo "[ssh-ident.fish]" $argv
end

function __sif_create_symlink
    if not test -L $__sif_home_bin_path/$argv
        ln -s $__sif_ssh_ident_bin_path  $__sif_home_bin_path/$argv
        log "Create symlink for $argv | $__sif_home_bin_path/$argv -> $__sif_ssh_ident_bin_path"
    end
end

function __sif_create_home_bin
    if [ ! -d $__sif_home_bin_path ]
        mkdir -p $__sif_home_bin_path
        log mkdir $__sif_home_bin_path
    end
end

function __sif_set_path
    if not contains $__sif_home_bin_path $fish_user_paths
        set -U fish_user_paths $__sif_home_bin_path $fish_user_paths
        log Update \$fish_user_paths to include $__sif_home_bin_path
    end
end


__sif_create_home_bin
__sif_set_path
__sif_create_symlink ssh
__sif_create_symlink scp
__sif_create_symlink sftp
