SSH = 'ssh -A -i ~/.ssh/id_rsa -l stefan'
desc "Run Puppet on ENV['CLIENT']"
task  :apply do
   client = ENV['CLIENT']
   sh "git push"
   ssh "#{SSH} #{client} pull-updates"
 end