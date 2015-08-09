SSH = '/usr/bin/ssh -tt -A -i ~/.ssh/id_rsa.pub -l stefan'

desc "Run Puppet on ENV['CLIENT']"
task  :apply do
   client = ENV['CLIENT']
   sh "git push"
   sh "#{SSH} #{client} pull-updates.sh"
 end
