# Regenerates Lyft project from current directory
function re() {
    export ALLOW_UNSUPPORTED_XCODE=1
    make -C $(git rev-parse --show-toplevel) update_dependencies
}

