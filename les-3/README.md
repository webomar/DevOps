
# Les - 3

  

  

## opdracht - 1


  
  

>Maak een playbook wat alle packages op je vm update:

zie updateplaybook.yaml

  
  

>Maak een playbook om een regel toe te voegen in /etc/hosts toe die naar je esxi server wijst. Noem de host esxi:

zie hostplaybook.yaml

  

>Maak een playbook die een user test toevoegt op een systeem:

zie gebruikerplaybook.yaml

  

>Maak een playbook wat het pakket fail2ban installeert op je vm. Gebruik de volgende configuratie (dit moet als configuratiebestand aanwezig zijn op je vm):

zie fail2banplaybook.yaml

  

>Maak een playbook dat van je vm de beschikbare diskspace ophaalt:

zie checkspaceplaybook.yaml . dit displayt hem op de terminal met behulp van het command (Run df -h command)

  
  
  
  
  
  

## opdracht - 2

> Doe het zelfde als bij opdracht 1 maar dan met 3 vm's en zorg dat de inventory automatisch gemaakt wordt

  
  

Ik heb met terraform een inventory op basis van de template gemaakt: inventory.tpl

Zie bestanden onder les-3/opdracht-2