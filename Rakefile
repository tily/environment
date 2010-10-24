require 'rake/clean'

HOME  = ENV['HOME']
FILES = ['Rakefile', '.bashrc', '.bash_profile', '.zshrc', '.vimrc', '.screenrc', 'bin', '.zsh']

CLEAN.include(FILES.map {|f| "#{HOME}/#{f}"})

desc 'environment install'
task :env_install do
  (FILES).each do |f|
    source = (f =~ /^\./) ? ('dot' + f) : f
    FileUtils.ln_s "#{HOME}/dev/environment/#{source}", "#{HOME}/#{f}"
  end
end

desc 'environment git diff'
task :env_diff do
  sh "cd #{HOME}/dev/environment/; git diff"
end

desc 'environment git add'
task :env_add do
  sh "cd #{HOME}/dev/environment/; git add ."
end

desc 'environment git commit'
task :env_commit do
  sh "cd #{HOME}/dev/environment/; git commit"
end

desc 'environment git push'
task :env_push do
  sh "cd #{HOME}/dev/environment/; git push origin master"
end

desc 'environment git pull'
task :env_pull do
  sh "cd #{HOME}/dev/environment/; git pull origin master"
end

