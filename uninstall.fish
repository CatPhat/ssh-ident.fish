function log
    echo "[ssh-ident.fish]" $argv
end

function __sif_remove_symbolic_links
    set -l bin $argv[1]
    set -l check_result (__sif_check_if_symbolic_link_is_valid $bin)
    if test valid = $check_result 
        set -l bin_path $__sif_home_bin_path/$bin
        rm $bin_path
        log removed $bin_path 
    end
end

for bin in $__sif_bins
    __sif_remove_symbolic_links $bin
end
