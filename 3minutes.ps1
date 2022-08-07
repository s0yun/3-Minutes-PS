Write-Host @'
#######################################
#                                     #
#        3 Minutes - Bring Focus      #
#                                     #
#######################################
'@

function Start-InhaleExhale {
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
}

function Request-Meditation { 

    function Start-Meditation {
        Write-Host "Great, we will get started. `nClose your eyes, the three minutes starts now"
        Start-Sleep -Seconds 300
        
        # Notifying the time is up
        $voice = New-Object -ComObject Sapi.spvoice
        $voice.rate = 1
        $voice.speak("Hey, your time is up!")

        Write-Host 'Thanks for taking a few minutes with me'
        Exit

    }
    function Deny-Meditation {
        Write-Host "Enjoy the rest of your day"
        
        Write-Host 'Thanks for taking a few minutes with me'
        Exit
    }




    # yes/no options for meditation
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription '&Yes', 'Are you ready to take a few moments: Yes'
    $no = New-Object System.Management.Automation.Host.ChoiceDescription '&No', 'Are you ready to take a few moments: No'
 
    #building title/header around options 
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $title = 'Bringing Focus'
    $message = 'Are you ready to take a few moments?'
    #querying for result
    $result = $host.ui.PromptForChoice($title, $message, $options, 0)


    switch ($result) {
        0 {Start-Meditation}
        1 {Deny-Meditation}
        }

}

try{
    Start-InhaleExhale
}
catch{
    Write-Error "I'm Sorry, something went wrong"
}
try{
Request-Meditation
}
catch {
    Write-Error "I'm sorry, something went wrong"
}