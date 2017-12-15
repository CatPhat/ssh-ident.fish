function __sif_check_if_path_is_valid
    set -l bin $argv[1]
    set -l correct_bin_path $__ssh_ident_fish_bin_path
    if test -e $correct_bin_path/$bin
        echo valid
    else
        echo $correct_bin_path/$bin does not exist
    end
end
