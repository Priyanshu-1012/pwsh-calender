    param (
        [Parameter(Mandatory=$false)]
        [ValidateRange(1, 12)]
        [int]$Month = (Get-Date).Month,

        [Parameter(Mandatory=$false)]
        [int]$Year = (Get-Date).Year
    )

    $cal = New-Object -TypeName System.Globalization.GregorianCalendar
    $firstDay = [datetime]::ParseExact("$Month/1/$Year", "M/d/yyyy", $null)
    $daysInMonth = $cal.GetDaysInMonth($Year, $Month)
    $startDayOfWeek = $firstDay.DayOfWeek
    Write-Host `n('     {0:MMMM, yyyy}' -f (Get-Date))  
    Write-Host ("{0,-20}" -f "`n Su Mo Tu We Th Fr Sa") -ForegroundColor magenta

    $dayCounter = 0
    for ($i = 0; $i -lt 6; $i++) {
        for ($j = 0; $j -lt 7; $j++) {
            if (($dayCounter -lt $daysInMonth) -and (($i -eq 0 -and $j -ge $startDayOfWeek) -or ($i -ne 0))) {
                $dayCounter++
                $currentDate = Get-Date -Year $Year -Month $Month -Day $dayCounter
                if ($dayCounter -eq (Get-Date).Day) {
                    Write-Host -NoNewline ("{0,3}" -f $dayCounter) -ForegroundColor green
                }
                elseif ($currentDate.DayOfWeek -eq 'Sunday') {
                    Write-Host -NoNewline ("{0,3}" -f $dayCounter) -ForegroundColor red
                }
                else {
                    Write-Host -NoNewline ("{0,3}" -f $dayCounter)
                }
            }
            else {
                Write-Host -NoNewline ("{0,3}" -f "")
            }
        }
        Write-Host
    }
