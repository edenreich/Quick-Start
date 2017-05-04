# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
 
  mainDirectory = File.dirname(__FILE__)

  # Configuration
  #===============
  # edit your virtual box name
  boxname = "github"

  # choose your hostname
  hostname = "dev.github.com"
  
  # modify it if you want to call your public directory differently
  # note: you have to create that directory otherwise vagrant won't boot
  publicDirectory = mainDirectory + "/www"
  scriptsDirectory = mainDirectory + "/scripts"

 
  config.vm.synced_folder publicDirectory, "/var/www"

  # The virtualbox image source
  config.vm.box = "ubuntu/trusty64"

  # The hostname, will appear in /etc/hosts
  config.vm.hostname = hostname
  
  # The virtualbox name
  config.vm.define boxname do |boxname| 
  end

  config.vm.network "private_network", ip: "192.168.33.13"
  
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  config.vm.box_check_update = true

  # Prevent TTY Errors
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.ssh.forward_agent = true

  # Update Packages
  config.vm.provision :shell do |shell| 
    shell.name = "Update Linux Packages"
    shell.args = [config.vm.hostname]
    shell.path = scriptsDirectory + "/update_packages.sh"
  end

  # Install Unzip
  config.vm.provision :shell do |shell| 
    shell.name = "Install Unzip"
    shell.path = scriptsDirectory + "/install_unzip.sh"
  end

  # Install PHP 7.0-fpm
  config.vm.provision :shell do |shell| 
    shell.name = "Install PHP 7.0"
    shell.path = scriptsDirectory + "/install_php.sh"
  end

  # Install Nginx Webserver
  config.vm.provision :shell do |shell| 
    shell.name = "Install Nginx Webserver"
    shell.path = scriptsDirectory + "/install_nginx.sh"
  end

  # Remove Default Nginx Webserver
  config.vm.provision :shell do |shell| 
    shell.name = "Remove Default Nginx Webserver"
    shell.path = scriptsDirectory + "/clear_nginx.sh"
  end

  # Add a Virtual Hosts to Nginx
  config.vm.provision :shell do |shell| 
    shell.name = "Create Nginx Webserver"
    shell.args = [config.vm.hostname]
    shell.path = scriptsDirectory + "/create_webserver.sh"
  end

  # Install Composer PHP Package manager
  config.vm.provision :shell do |shell| 
    shell.name = "Install Composer PHP Package Manager"
    shell.path = scriptsDirectory + "/install_composer.sh"
  end

  # Install Git
  config.vm.provision :shell do |shell| 
    shell.name = "Install Git"
    shell.path = scriptsDirectory + "/install_git.sh"
  end

  # Install Redis
  config.vm.provision :shell do |shell| 
    shell.name = "Install Redis"
    shell.path = scriptsDirectory + "/install_redis.sh"
  end
end
