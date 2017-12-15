function __sif_check_if_symbolic_link_is_valid
    set -l valid_ssh_ident_path $__sif_ssh_ident_bin_path
    set -l valid_home_bin_path $__sif_home_bin_path
    set -l bin $argv[1]
    set -l current_bin_path (type -p $bin)
    if test $status -eq 1
	echo Could not find $bin
	return
    end
    set -l current_symbolic_link_path (readlink -f $current_bin_path)
    if test $valid_ssh_ident_path = $current_symbolic_link_path
        echo valid
    else
        echo Current $current_symbolic_link_path is not the correct. Should be $valid_ssh_ident_path
    end
end
