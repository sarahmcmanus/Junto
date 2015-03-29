#!/bin/sh 

# Install rvm and ruby:
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=ruby-2.2.0 --with-default-gems="bundler"
echo 'gem: --no-document' >> ~/.gemrc
source /home/vagrant/.rvm/scripts/rvm
gem install bundler

# Set the application up
cd /vagrant
bundle install
rake db:setup
gem install foreman

# For convenience:
echo 'cd /vagrant' >> ~/.bash_profile
