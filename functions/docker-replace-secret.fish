function docker-replace-config
    set -l stack $argv[1]
    set -l service $argv[2]
    for conf in $argv[3..-1]
        docker service update --config-rm $stack_$conf $stack_$service
        docker config rm $stack_$conf
    end
    if test -f docker-compose-$stack.yaml
        docker stack deploy $stack --compose-file docker-compose-$stack.yaml --with-registry-auth
    else
        docker stack deploy $stack --compose-file docker-compose/$stack.yaml --with-registry-auth
    end
end
