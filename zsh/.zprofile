# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

for file in "$(find ~/.local/bin/ -maxdepth 1 -name '*.sh' -print -quit)"; do source $file; done
