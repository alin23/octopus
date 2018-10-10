function fasd_subl_folder
    set -l fasd_ret (fasd -d "$argv")
    if [ -d "$fasd_ret" ]
        subl "$fasd_ret"
    else
        echo "$fasd_ret"
    end
end
