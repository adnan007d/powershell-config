Clone this repo in `$HOME/.config/powershell`


Load the init script in your `$PROFILE` file:
```ps1
$customProfilePath = "$HOME/.config/powershell"

$initPath = "$customProfilePath/init.ps1"

if (Test-Path $initPath) {
    . $initPath
}
```

You are now ready to go!


Work in progress...

Dependencies:
- [fnm](https://github.com/Schniz/fnm)
- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)
- [posh-git](https://github.com/dahlbyk/posh-git)


## Functions

- `Load-Git`: Loads posh-git
- `Unload-Git`: Unloads posh-git
