# If you use fnm for node version management
if (Get-Command fnm -ErrorAction SilentlyContinue) {
    fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
}

# This is for sending OSC 7 sequences
# Taken from https://wezfurlong.org/wezterm/shell-integration.html?h=shell#osc-7-on-windows-with-powershell
function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
        $osc7 = ""
        if ($p.Provider.Name -eq "FileSystem") {
            $ansi_escape = [char]27
                $provider_path = $p.ProviderPath -Replace "\\", "/"
                $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
        }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}

if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/robbyrussell.omp.json" | Invoke-Expression
}

function IsPoshGitInstalled {
    return (Get-Module -ListAvailable -Name "posh-git" -ErrorAction SilentlyContinue) -ne $null
}

function LoadGit {
    if (-not (IsPoshGitInstalled)) {
        Write-Warning "posh-git is not installed."
        return;
    }

    Import-Module posh-git
}

function UnloadGit {
    if (-not (IsPoshGitInstalled)) {
        Write-Warning "posh-git is not installed."
        return;
    }

    Remove-Module posh-git
}

Set-Alias -Name Load-Git -Value LoadGit
Set-Alias -Name Unload-Git -Value UnloadGit
