function xcdir
    argparse --name xcdir 'w/workspace' 'c/configuration=' 'f/file=' 's/scheme=' -- $argv
    or return 1

    if set -q _flag_file
        set proj $_flag_file
    else
        set proj (ls | grep '.xcworkspace' 2>/dev/null || ls | grep '.xcodeproj' 2>/dev/null)
    end

    if empty "$proj"
        echo "No xcode project found"
        return 1
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

    if set -q _flag_workspace; or string match -eq xcworkspace $proj
        set projtype '-workspace'
    else
        set projtype '-project'
    end


    xcodebuild -scheme $scheme "$projtype" $proj ONLY_ACTIVE_ARCH=NO -configuration $config -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*"
end
