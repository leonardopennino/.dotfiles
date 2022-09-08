
# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
PATH=$PATH:/opt/apache-maven-3.8.3/bin
export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> coursier install directory >>>
export PATH="$PATH:/Users/leonardo/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
