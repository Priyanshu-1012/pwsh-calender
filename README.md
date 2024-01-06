# pwsh-calender
calender in powershell


## Installation

1. Download the powershell script and save it somewhere
2. Open pwsh terminal and type `notepad $profile` or whatever code editor you use( like `vim $profile`)
3. And in `profile` file write
 ```pwsh
Function cal {
    & 'path\to\cal.ps1'
}
  ```
4. Reload terminal and you can see the calender by typing command `cal`
