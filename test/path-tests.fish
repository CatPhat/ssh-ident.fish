test "$TESTNAME: $HOME/bin exists"
    -d $HOME/bin
end

for bin in $__sif_bins
    test "$TESTNAME: $bin has a valid path."
        valid = (__sif_check_if_path_is_valid $bin)
    end
    test "$TESTNAME: $bin has a valid symbolic link."
        valid = (__sif_check_if_symbolic_link_is_valid $bin)
    end
end
