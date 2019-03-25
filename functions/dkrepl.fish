function dkrepl
    set -l item $argv[1]
    set -l stack $argv[2]
    set -l service $argv[3]
    for conf in $argv[4..-1]
        echo "Removing $item $conf from $stack $service"
        docker service update --$item-rm "$stack"_"$conf" "$stack"_"$service"
        docker $item rm "$stack"_"$conf"
    end
    if test -f docker-compose-"$stack".yaml
        docker stack deploy $stack --compose-file docker-compose-"$stack".yaml --with-registry-auth
    else
        docker stack deploy $stack --compose-file docker-compose/"$stack".yaml --with-registry-auth
    end
end
