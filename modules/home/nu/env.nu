use std "path add"

# Homebrew
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"
$env.INFOPATH = ["/opt/homebrew/share/info"]

$env.NUPM_HOME = ($nu.default-config-dir | path join "nupm")
$env.NU_LIB_DIRS ++= ($env.NUPM_HOME | path join "modules")


# ssh
$env.SSH_AUTH_SOCK = $"($env.HOME)/.1password/agent.sock"

$env.JAVA_HOME = (/usr/libexec/java_home -v 17)

path add [
    $"($env.HOMEBREW_PREFIX)/bin"
    $"($env.HOMEBREW_PREFIX)/sbin"
    $"($env.HOME)/.local/bin"
    $"($env.HOME)/.cargo/bin"
    $"($env.NUPM_HOME | path join "scripts")"
]

path add -a "/usr/local/bin"
