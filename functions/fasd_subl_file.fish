function fasd_subl_file
    set -l fasd_ret (fasd -f "$argv")
    if [ -f "$fasd_ret" ]
        subl "$fasd_ret"
    else
        echo "$fasd_ret"
    end
end
