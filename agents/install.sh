#!/usr/bin/env bash

source_dir="$DOTFILES/agents"
claude_dir="$HOME/.claude"
codex_dir="$HOME/.codex"

die() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

link_file() {
    local src="$1"
    local dst="$2"

    # Already points to the right place — nothing to do
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "Already linked $dst"
        return
    fi

    # Remove whatever's in the way (stale symlink or regular file)
    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        rm -rf "$dst"
    fi

    ln -s "$src" "$dst" && echo "Linked $dst → $src"
}

unlink_file() {
    local dst="$1"

    if [ -L "$dst" ]; then
        rm "$dst"
        echo "Unlinked $dst"
    fi
}

# Generate Codex rules and Claude Bash permissions from allowed-commands
generate_permissions() {
    local commands_file="$source_dir/allowed-commands"
    local settings_file="$source_dir/claude/settings.json"
    local rules_file="$source_dir/codex/rules/default.rules"

    # Generate Codex prefix_rule entries
    {
        while IFS= read -r line || [[ -n "$line" ]]; do
            if [[ -z "$line" ]]; then
                echo
            elif [[ "$line" == \#* ]]; then
                echo "$line"
            else
                local pattern
                pattern=$(echo "$line" | awk '{for(i=1;i<=NF;i++) printf "\"%s\"%s", $i, (i<NF?", ":""); }')
                echo "prefix_rule(pattern=[$pattern], decision=\"allow\")"
            fi
        done <"$commands_file"
    } >"$rules_file"
    echo "Generated $rules_file"

    # Generate Claude Bash permissions and merge into settings.json
    local bash_perms
    bash_perms=$(while IFS= read -r line || [[ -n "$line" ]]; do
        [[ -z "$line" || "$line" == \#* ]] && continue
        echo "Bash($line*)"
    done <"$commands_file" | jq -R . | jq -s .)

    local non_bash
    non_bash=$(jq '[.permissions.allow[] | select(startswith("Bash(") | not)]' "$settings_file")

    local all_perms
    all_perms=$(jq -n --argjson bash "$bash_perms" --argjson other "$non_bash" '$bash + $other')

    jq --argjson perms "$all_perms" '.permissions.allow = $perms' "$settings_file" >"$settings_file.tmp" &&
        mv "$settings_file.tmp" "$settings_file"
    echo "Updated permissions in $settings_file"
}

install() {
    mkdir -p "$claude_dir" "$codex_dir"

    # Generate permissions from shared allowed-commands
    generate_permissions

    # Shared: instructions
    link_file "$source_dir/INSTRUCTIONS.md" "$claude_dir/CLAUDE.md"
    link_file "$source_dir/INSTRUCTIONS.md" "$codex_dir/AGENTS.md"

    # Shared: skills
    link_file "$source_dir/skills" "$claude_dir/skills"
    link_file "$source_dir/skills" "$codex_dir/skills"

    # Claude-specific
    link_file "$source_dir/claude/settings.json" "$claude_dir/settings.json"

    # Codex-specific
    link_file "$source_dir/codex/config.toml" "$codex_dir/config.toml"
    link_file "$source_dir/codex/rules" "$codex_dir/rules"
}

uninstall() {
    # Shared
    unlink_file "$claude_dir/CLAUDE.md"
    unlink_file "$codex_dir/AGENTS.md"
    unlink_file "$claude_dir/skills"
    unlink_file "$codex_dir/skills"

    # Claude-specific
    unlink_file "$claude_dir/settings.json"

    # Codex-specific
    unlink_file "$codex_dir/config.toml"
    unlink_file "$codex_dir/rules"
}

if [[ $# != 1 ]]; then
    die
fi

if [[ $1 == "install" ]]; then
    install
elif [[ $1 == "uninstall" ]]; then
    uninstall
else
    die
fi
