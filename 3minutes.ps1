$voice = New-Object -ComObject Sapi.spvoice
$voice.rate = 0.5


write-Host @'
#######################################
#                                     #
#        3 Minutes - Bring Focus      #
#                                     #
#######################################
'@

# yes/no options for audio walkthrough
$voicegudied = New-Object System.Management.Automation.Host.ChoiceDescription '&Voice Gudided', 'Voice Guided'
$textgudied = New-Object System.Management.Automation.Host.ChoiceDescription '&Text Guided', 'Text Guided'

#building title/header around options 
$options = [System.Management.Automation.Host.ChoiceDescription[]]($voicegudied, $textgudied)
$title = 'Bringing Focus'
$message = 'I am built with a voice to help you through this.'
#querying for result
$voiceornot = $host.ui.PromptForChoice($title, $message, $options, 0)

    if ($voiceornot -eq 0) {
        Start-VoiceInhaleExhale
    }
    if ($voiceornot -eq 1) {
        Start-TextInhaleExhale
    }

    ##Voice Guided
    function Start-VoiceInhaleExhale {

        $voice.speak("We're going to take a couple of nice deep breaths now `nReady?") | Out-Null
            Start-Sleep 1 
            [int]$breaths = 0
            do {
            $breaths ++
            [int]$second = 0
                do {
                    $second ++
                    $voice.speak("Inhale for $second") | Out-Null
                    Start-Sleep 1
                } until (
                    $second -eq 4
                )
                $voice.speak("Great! You are doing great!") | Out-Null
                [int]$second = 0
                do {
                    $second ++
                    $voice.speak("Hold it in for $second") | Out-Null
                    Start-Sleep 1
                    } until (
                    $second -eq 3
                )
                [int]$second = 0
                do {
                    $second ++
                    $voice.speak("Exhale for $second") | Out-Null
                    Start-Sleep 1
                    } until (
                    $second -eq 4
                )
                if ($breaths -ne 2) {
                    $voice.speak("And again") | Out-Null
                }
            } until (
                $breaths -eq 2
            )
        
        $voice.Speak("If you press enter after this message, we'll begin the meditation. For this you need to close your eyes and try to count the seconds untill I tell you your time is up, okay?") | Out-Null
        Request-Meditation
        }

function Start-TextInhaleExhale {

Write-Host "We're going to take a couple of nice deep breaths now `nReady?"
    # Start-Sleep 1
    # [int]$breaths = 0
    
    # do {
    # $breaths = $breaths +1
    # [int]$second = 0
    #     do {
    #         $second = $second +1
    #         Write-Host "Inhale for $second"
    #         Start-Sleep 1
    #     } until (
    #         $second -eq 4
    #     )
    #     Write-Host 'Great! You are doing great!'
    #     [int]$second = 0
    #     do {
    #         $second = $second +1
    #         Write-Host "Hold it in for $second"
    #         Start-Sleep 1
    #         } until (
    #         $second -eq 3
    #     )
    #     [int]$second = 0
    #     do {
    #         $second = $second +1
    #         Write-Host "Exhale for $second"
    #         Start-Sleep 1
    #         } until (
    #         $second -eq 4
    #     )
    #     if ($breaths -ne 2) {
    #         Write-Host 'And again,'
    #     }
    # } until (
    #     $breaths -eq 2
    # )

    Write-Host "Now it is time for you to close your eyes, we have a timer `nit is set for three minutes, after this I will tell you that your time is up"
    Request-Meditation

}
    function Start-SpeachMeditation {
        $voice.Speak("Great, we will get started.") | Out-Null
        Start-Sleep -Seconds 2
        
        # Notifying the time is up
        $voice = New-Object -ComObject Sapi.spvoice
        $voice.rate = 0.5
        $voice.speak("Hey, your time is up!") | Out-Null
        $voice.Speak('Thanks for taking a few minutes with me') | Out-Null
        Exit
    }
    function Deny-Meditation {
        Write-Host "Enjoy the rest of your day"
        Write-Host 'Thanks for taking a few minutes with me'
        Exit
    }
function Request-Meditation { 


    # yes/no options for meditation
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription '&Yes', 'Are you ready to take a few moments: Yes'
    $no = New-Object System.Management.Automation.Host.ChoiceDescription '&No', 'Are you ready to take a few moments: No'
 
    #building title/header around options 
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $title = ''
    $message = 'Are you ready to take a few moments?'
    #querying for result
    $result = $host.ui.PromptForChoice($title, $message, $options, 0)


}
if (($voiceornot -eq 0) -and ($result -eq 0)){
    Write-Host 'running voice meditation'
}
elseif (($voiceornot -eq 0) -and ($result -eq 1)) {
    Write-Host 'not running meditation'
}
elseif (($voiceornot -eq 1) -and ($result -eq 0)) {
Write-Host 'running text meditation with notification that time is up'
}
elseif (($voiceornot -eq 1) -and ($result -eq 1)) {
Write-Host 'not doing a fucking thing.'
}