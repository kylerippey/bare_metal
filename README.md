BareMetal
==========

A ruby toolkit for simple server bootstrapping and maintenance.

### Usage

First install the gem.

```
gem install 'bare_metal'
```

### Example script

Once the gem is installed, we're ready to write a script:

```
require 'bare_metal'

machine1 = BareMetal::Machine.new(:host => 'IP_ADDRESS', :username => 'USERNAME')

# Allocate some swap space
machine1.allocate_swap_space('2G')

# Install packages
machine1.install(
  'build-essential',
  'git',
  'ruby-dev',
  'nginx'
)

# Create users
machine1.add_user('deployer')

# Upload files
machine1.mkdir('/home/deployer/.ssh', :chown => 'deployer:deployer')
machine1.upload('/local/path/to/deployer.key', '/home/deployer/.ssh/id_rsa', :chmod => '600')

machine1.upload('/local/path/to/nginx.conf', '/etc/nginx/nginx.conf')
machine1.upload('/local/path/to/sites-available/mysite.com', '/etc/nginx/sites-available/mysite.com')

# Create symlinks
machine1.symlink('/etc/nginx/sites-available/mysite.com', '/etc/nginx/sites-enabled/mysite.com')

# Execute commands
machine1.execute('service nginx restart')
```
