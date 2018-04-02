# Regenerates Lyft project from current directory
function re() {
    export ALLOW_UNSUPPORTED_XCODE=1
    gr
    make update_dependencies
    cd -
}

