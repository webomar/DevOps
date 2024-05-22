# Les - 4

  
  
  

## opdracht - 1
> Maak een playbook waarin je Nginx installeert, en maak gebruik van een handler om nginx na installatie te herstarten
  
Onder het map **les-4/opdracht-1** zie je de playbook. Hierin heb ik ervoor gezorgd dat Nginx wordt geïnstalleerd en dat het wordt herstart na installatie m.b.v. een handler.
```yaml
```

## opdracht - 2
>Maak nu zelf een role en playbook waarin je NodeJS installeert en installeer het nodejs package jslint. (let op, er hoeft dus geen nodejs applicatie te worden gedeployed)  

Onder het map **les-4/opdracht-2** heb ik een role gemaakt voor het installeren van JSLint en NodeJS.
```yaml
---
- name: Install Node.js
  apt:
	name: nodejs
	state: present

- name: Install NPM
  apt:
	name: npm
	state: present

- name: Install JSLint
  npm:
	name: jslint
	global: yes
	state: present
```
In de playbook heb ik de role **nodejs** gerund
```yaml
---
- hosts: app
   become: true

   roles:
	- nodejs
```


## opdracht - 3
> - Deploy 2 vm's. Zorg ervoor dat de IP's en hostnamen in een inventory komen. Maak Ansible roles die apache, php en php-mysql op vm 1 installeren en mysql op vm 2. In je inventory moet duidelijk zijn dat het om een webserver en een database server gaat.
> - Zoek uit wat Ansible Galaxy is en upload je zojuist aangemaakte roles hier naar toe.

Met terraform heb ik ervoor gezorgd dat een inventory wordt gemaakt.
Ik heb 2 role gemaakt: 
- webserver (voor het installeren van apache, php en php-mysql)
- database (voor het installeren van mysql)

In de playbook heb ik elke role aan de juiste host gekoppeld.
```yml
---

- hosts: webserver
  become: true
  roles:
	- webserver
	- 
- hosts: database
  become: true
  roles:
	- database
```


Hier zijn de links naar mijn Rollen op Ansible-Galaxy:

https://galaxy.ansible.com/ui/standalone/roles/webomar/mysql-dbserver/

https://galaxy.ansible.com/ui/standalone/roles/webomar/webserver/