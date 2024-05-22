# Les - 6

  
  

## opdracht - 1
> Deploy met Terraform een VM op je ESXi server. schrijf een Ansible playbook dat de installatie van docker op deze VM automatiseert. 


  
Ik heb met tf een vm gedeployed, SSH toegang geregeld. (zie ../les-6/opdracht-1/main.tf)

 ik heb docker via de repo geinstalleerd. zie playbook.yaml:
de playbook bevat alle packages die nodig zijn voor het draaien van docker op een ubuntu


## opdracht - 2
> schrijf een playbook dat 2 nginx containers deployet die begroetingspagina tonen.

in de containersplaybook.yaml zie hoe ik dit heb gedaan:
1 ik heb nginx image gepulld
2 ik heb het html bestand op een centrale plek op de server gezet (bestanden/omar_studentnummber.html).
3 ik heb het op de juiste path op nginx geplaatst
4 ik heb de containers getest door naar de browser te gaan en de juiste poort te typen. Beide containers doen het



## opdracht - 3
> reverse proxy implementeren en een role van maken