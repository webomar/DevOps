# Les - 5
  


## opdracht - 1
> Maak een playbook waarbij het pakket apache2 wordt geinstaleerd en er een melding wordt gegeven als dit gelukt is.

  
In de playbook zie je hoe ik een success bericht toon als dit gelukt is:

```yaml

  - name: Print message if Apache2 is installed successfully
    debug:
      msg: "Apache2 is installed successfully!"
    when: apache_install_result.changed


```


## opdracht - 2
> Docker installeren, mezelf aan docker group tovoegen, molecule installeren en de bijbehorende drivers, ansible playbook maken.



Ik heb de onderstaande commands uitgevoerd op het VM:

```shell
sudo apt install docker.io

sudo usermod -aG docker omarssh
pip install molecule
pip install molecule-docker

sudo apt install yamllint
```



