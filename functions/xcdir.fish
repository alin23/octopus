function xcdir
    argparse --name xcdir 'w/workspace' 'c/configuration=' 'f/file=' 's/scheme=' -- $argv
    or return 1

    if set -q _flag_file
        set proj $_flag_file
    else
        set proj (find . -depth 1 -a -name '*.xcodeproj' || find . -depth 1 -a -name '*.xcworkspace')
    end

    if set -q _flag_configuration
        set config $_flag_configuration
    else
        set config Release
    end

    if set -q _flag_scheme
        set scheme $_flag_scheme
    else
        set scheme Release
    end

    if set -q _flag_workspace
        set workspace '-workspace'
    else
        set workspace ''
    end


    xcodebuild -scheme $scheme $workspace $file ONLY_ACTIVE_ARCH=NO -configuration $config -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*"
end
