$dir = split-path -parent $MyInvocation.MyCommand.Definition

$date = [DateTime]::Now.ToString("yyyy-MM-dd")
$backupdir = "~\dotfiles-backup-$date\"

$homedir = (Resolve-Path "~\").Path

if(!(Test-Path $backupdir)) {
    mkdir $backupdir | Out-Null
}

Get-ChildItem "$dir" | `
Foreach-Object {
    $name = ([System.IO.Path]::GetFileNameWithoutExtension($_.FullName))
    if ( $name -ne "install" ) {
        if (Test-Path ~\$_) {
            mv ~\$_ $backupdir
        }
        if ( $_ -is [System.IO.DirectoryInfo]) {
            cmd /c mklink /j "$homedir\$_" "$dir\$_"
        } else {
            cmd /c mklink "$homedir\$_" "$dir\$_"
        } 
    }
}

if (!(Test-Path "~\.vim\bundle\Vundle.vim")) {
    git clone https://github.com/gmarik/Vundle.vim.git $homedir/.vim/bundle/Vundle.vim
}