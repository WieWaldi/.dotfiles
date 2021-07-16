# +-------------------------------------------------------------------------+
# | ~/.config/powershell/Microsoft.PowerShell_profile.ps1                   |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

# https://github.com/neilpa/cmd-colors-solarized
echo "Setting Colors to Solarized Light."

$Host.PrivateData.ErrorForegroundColor = 'Red'
$Host.PrivateData.WarningForegroundColor = 'Yellow'
$Host.PrivateData.DebugForegroundColor = 'Green'
$Host.PrivateData.VerboseForegroundColor = 'Blue'
$Host.PrivateData.ProgressForegroundColor = 'Gray'
$Host.PrivateData.ErrorBackgroundColor = 'Gray'
$Host.PrivateData.WarningBackgroundColor = 'Gray'
$Host.PrivateData.DebugBackgroundColor = 'Gray'
$Host.PrivateData.VerboseBackgroundColor = 'Gray'
$Host.PrivateData.ProgressBackgroundColor = 'Cyan'
if (Get-Module -ListAvailable -Name "PSReadline") {
    $options = Get-PSReadlineOption
    if ([System.Version](Get-Module PSReadline).Version -lt [System.Version]"2.0.0") {
        $options.CommandForegroundColor = 'Yellow'
        $options.ContinuationPromptForegroundColor = 'DarkYellow'
        $options.DefaultTokenForegroundColor = 'DarkYellow'
        $options.EmphasisForegroundColor = 'Cyan'
        $options.ErrorForegroundColor = 'Red'
        $options.KeywordForegroundColor = 'Green'
        $options.MemberForegroundColor = 'DarkGreen'
        $options.NumberForegroundColor = 'DarkGreen'
        $options.OperatorForegroundColor = 'DarkCyan'
        $options.ParameterForegroundColor = 'DarkCyan'
        $options.StringForegroundColor = 'Blue'
        $options.TypeForegroundColor = 'DarkBlue'
        $options.VariableForegroundColor = 'Green'
        $options.CommandBackgroundColor = 'White'
        $options.ContinuationPromptBackgroundColor = 'White'
        $options.DefaultTokenBackgroundColor = 'White'
        $options.EmphasisBackgroundColor = 'White'
        $options.ErrorBackgroundColor = 'White'
        $options.KeywordBackgroundColor = 'White'
        $options.MemberBackgroundColor = 'White'
        $options.NumberBackgroundColor = 'White'
        $options.OperatorBackgroundColor = 'White'
        $options.ParameterBackgroundColor = 'White'
        $options.StringBackgroundColor = 'White'
        $options.TypeBackgroundColor = 'White'
        $options.VariableBackgroundColor = 'White'
    } else {
        $options.CommandColor = 'Yellow'
        $options.ContinuationPromptColor = 'DarkYellow'
        $options.DefaultTokenColor = 'DarkYellow'
        $options.EmphasisColor = 'Cyan'
        $options.ErrorColor = 'Red'
        $options.KeywordColor = 'Green'
        $options.MemberColor = 'DarkGreen'
        $options.NumberColor = 'DarkGreen'
        $options.OperatorColor = 'DarkCyan'
        $options.ParameterColor = 'DarkCyan'
        $options.StringColor = 'Blue'
        $options.TypeColor = 'DarkBlue'
        $options.VariableColor = 'Green'
    }
}

# Colorful PowerShell Prompt
function prompt
{  
    $ESC = [char]27
    "$ESC[48;2;95;0;95m$ESC[38;2;253;246;227m $ESC[48;2;135;0;175m$ESC[38;2;95;0;95m$ESC[38;2;253;246;227m" +
    " $(Get-Location)" +
    "$ESC[48;2;175;135;215m$ESC[38;2;135;0;175m" +
    " $(Get-Date -Format HH:mm:ss)" +
    "$ESC[48;2;0m$ESC[38;2;175;135;215m "
}
