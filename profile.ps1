
Import-Module posh-git

# Alias
function browse { start-process "chrome.exe" $args }
function home { cd $home }
function bg() { start-process -NoNewWindow @args }
function reload { . "$home\Documents\WindowsPowerShell\profile.ps1" $args }

set-alias ll ls # long list
function l { ls | Format-Wide } # normal ls as Linux
function lsd { ls | grep -E '^d'} # list only directories
function lsf { ls | grep -Ev '^d'} # list only files

function .. { cd .. }
function ... { cd ../.. }
function .... { cd ../../.. }

# work env
function jweb { cd D:/sourcecode/jetabroad/Jetabroad.Web/ }
function jcms { cd D:/sourcecode/jetabroad-cms/ }
function run_static_gen { D:\sourcecode\jetabroad\Jetabroad.CheapFlight\bin\Debug\Jetabroad.CheapFlight.exe --GenerateStaticPage }
set-alias msbuild C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe
