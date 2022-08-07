Write-Host @'
#######################################
#                                     #
#        3 Minutes - Bring Focus      #
#                                     #
#######################################
'@

Write-Host "We're going to take a couple of nice deep breaths now `nReady?"
Start-Sleep 1
[int]$breaths = 0
do {
$breaths = $breaths +1
[int]$second = 0
    do {
        $second = $second +1
        Write-Host "Inhale for $second"
        Start-Sleep 1
        } until (
        $second -eq 4
    )
    Write-Host 'Great! You are doing great!'
    [int]$second = 0
    do {
        $second = $second +1
        Write-Host "Hold it in for $second"
        Start-Sleep 1
        } until (
        $second -eq 3
    )
    [int]$second = 0
    do {
        $second = $second +1
        Write-Host "Exhale for $second"
        Start-Sleep 1
        } until (
        $second -eq 4
    )
    if ($breaths -ne 2) {
        Write-Host 'And again,'
    }
} until (
    $breaths -eq 2
)

Write-Host "Now it is time for you to close your eyes, we have a timer `nit is set for three minutes, after this I will tell you that your time is up"

$yes = New-Object System.Management.Automation.Host.ChoiceDescription '&Yes', 'Are you ready to take a few moments: Yes'
$no = New-Object System.Management.Automation.Host.ChoiceDescription '&No', 'Are you ready to take a few moments: No'
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$title = 'Bringing Focus'
$message = 'Are you ready to take a few moments?'
$result = $host.ui.PromptForChoice($title, $message, $options, 0)

switch ($result) {
    0 {Write-Host "Great, we will get started. `nClose your eyes, the three minutes starts now"
        Start-Sleep 300}
    1 {Write-Host "Okay, perhaps next time."}
    }

$voice = New-Object -ComObject Sapi.spvoice
$voice.rate = 1
$voice.speak("Hey, your time is up!")

Write-Host 'Thanks for taking a few minutes with me'
Start-Process "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"