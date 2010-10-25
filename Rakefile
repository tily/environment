require 'rake/clean'

HOME  = ENV['HOME']
FILES = ['Rakefile', '.bashrc', '.bash_profile', '.zshrc', '.vimrc', '.screenrc', 'bin', '.zsh']

CLEAN.include(FILES.map {|f| "#{HOME}/#{f}"})

desc 'environment install'
task :env_install do
  FILES.each do |f|
    source = (f =~ /^\./) ? ('dot' + f) : f
    FileUtils.ln_s "#{HOME}/dev/environment/#{source}", "#{HOME}/#{f}"
  end
end

gits = ['diff', 'status', 'add .', 'commit', 'push origin master', 'pull origin master']
gits.each do |g|
  t = g[/^[^\s]+/]
  desc "environment git #{g}"
  task "env_#{t}" do
    FileUtils.cd "#{HOME}/dev/environment"
    sh "git #{g}"
  end
end

