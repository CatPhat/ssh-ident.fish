set correct_bin_path $__ssh_ident_fish_bin_path
set true_ssh_ident_path $__ssh_ident_fish_bin

function check_if_path_exists
    set bin $argv[1]
    if test -e $correct_bin_path/$bin
        echo exists
    else 
        echo $correct_bin_path/$bin does not exist
    end
end

function check_if_bin_is_symbolic_link
    set bin $argv[1]
    set full_bin_path $correct_bin_path/$bin
    if test -L $full_bin_path
        echo symbolic
    else
        echo $full_bin_path is not a symbolic link.
    end
end

function check_if_symbolic_path_is_true
    set bin $argv[1]
    set full_bin_path $correct_bin_path/$bin
    set symbolic_path (readlink -f $full_bin_path)
    if test $true_ssh_ident_path = $symbolic_path
        echo true
    else
        echo Current $symbolic_path is not the correct $true_ssh_ident_path
    end
end
    

test "$TESTNAME: Base test $BASENAME"
    -z ""
end

test "$TESTNAME: $HOME/bin exists"
    -d $HOME/bin
end

test "$TESTNAME: SSH exists in correct directory"
    exists = (check_if_path_exists ssh)
end

test "$TESTNAME: SSH bin is a symbolic link"
    symbolic = (check_if_bin_is_symbolic_link ssh)
end

test "$TESTNAME: SSH bin is correct symbolic link"
    true = (check_if_symbolic_path_is_true ssh)
end

test "$TESTNAME: scp exists in correct directory"
    exists = (check_if_path_exists scp)
end

test "$TESTNAME: scp bin is a symbolic link"
    symbolic = (check_if_bin_is_symbolic_link scp)
end

test "$TESTNAME: scp bin is correct symbolic link"
    true = (check_if_symbolic_path_is_true scp)
end

test "$TESTNAME: sftp exists in correct directory"
    exists = (check_if_path_exists sftp)
end

test "$TESTNAME: sftp bin is a symbolic link"
    symbolic = (check_if_bin_is_symbolic_link sftp)
end

test "$TESTNAME: sftp bin is correct symbolic link"
    true = (check_if_symbolic_path_is_true sftp)
end

