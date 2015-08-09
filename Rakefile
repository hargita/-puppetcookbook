SSH = '/usr/bin/ssh -tt -A -i ~/.ssh/id_rsa.pub -l stefan'
REPO = 'git@github.com:hargita/-puppetcookbook.git'
desc "Run Puppet on ENV['CLIENT']"
task  :apply do
   client = ENV['CLIENT']
   sh "git push"
   sh "#{SSH} #{client} pull-updates.sh"
 end

desc "Bootstrap Puppet on ENV['CLIENT'] with hostname ENV['HOSTNAME']"
task :bootstrap do
  client = ENV['CLIENT']
  hostname = ENV['HOSTNAME'] || client
  commands = <<BOOTSTRAP
sudo hostname #{hostname} && \
sudo su -c "echo #{hostname} > /etc/hostname" && \
sudo yum -y localinstall http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-11.noarch.rpm && \
sudo yum clean all && \
sudo yum -y install git puppet && \
echo -e \"Host github.com\n\tStrictHostKeyChecking no\n\" >> /home/stefan/.ssh/config && \
chmod 600 /home/stefan/.ssh/config && \
git clone #{REPO} puppet && \
sudo puppet apply --modulepath=/home/stefan/puppet/modules /home/stefan/puppet/manifests/site.pp
BOOTSTRAP
 sh "#{SSH} #{client} '#{commands}'"
end

desc "Add syntax check hook to your git repo"
task :add_check do
	 here = File.dirname(__FILE__)
	 sh "ln -s #{here}/hooks/check_syntax.sh #{here}/.git/hooks/pre-commit"
	puts "Puppet syntax check hook added"
end