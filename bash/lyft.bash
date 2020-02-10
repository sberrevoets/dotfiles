# Regenerates Lyft project from current directory
function re() {
    export INCLUDE_NON_APP_TRANSITIVE=2
    export NO_SWIFTLINT=1
    make -C $(git rev-parse --show-toplevel) update_dependencies targets=Lyft
}
