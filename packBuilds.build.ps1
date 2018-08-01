$packerVariables = [PSCustomObject]@{
    os_name = "win2012r2"
    headless = "true"
    iso_checksum = "849734F37346385DAC2C101E4AACBA4626BB141C"
    iso_checksum_type = "SHA1"
    iso_url = "http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO"
    guest_os_type = "Windows2012_64"
    install_vbox_tools = "true"
}

task packer-win-base {
    if (-not (Test-Path -Path ./output/variables))
    {
        New-Item -Path ./output/variables -ItemType Directory -Force
    }

    $variablesPath = './output/variables/variables.json'

    $packerVariables |
        ConvertTo-Json |
        Out-File -FilePath $variablesPath -Encoding ascii
    
    packer build -var-file $variablesPath ./builders/virtualbox/win-base.json
}

task packer-win-boxstarter {
    if (-not (Test-Path -Path ./output/variables))
    {
        New-Item -Path ./output/variables -ItemType Directory -Force
    }

    $variablesPath = './output/variables/variables.json'

    $packerVariables |
        ConvertTo-Json |
        Out-File -FilePath $variablesPath -Encoding ascii
    
    packer build -var-file $variablesPath ./builders/virtualbox/win-boxstarter.json
}

task box-win-base {
    vagrant --% box add --name packbuilds/win2012r2-base --force ./output/box/virtualbox-win2012r2-base.box
}

task box-win-boxstarter {
    vagrant --% box add --name packbuilds/win2012r2-boxstarter --force ./output/box/virtualbox-win2012r2-boxstarter.box
}

task . packer-win-boxstarter, box-win-boxstarter
