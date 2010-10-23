
# config
HOME  = ENV['HOME']
FILES = ['Rakefile', '.bashrc', '.zshrc', '.vimrc', '.screenrc']

# deploy files
FILES.each do |f|
  desc "deploy #{f}"
  file f do
    source = (f =~ /^\./) ? ('dot' + f) : f
    FileUtils.ln_s "#{HOME}/dev/environment/#{source}", "#{HOME}/#{f}"
  end
end

# deploy all files
desc 'deploy all files'
task :deploy => FILES

# diff files
FILES.each do |f|
  desc "diff #{f}"
  task "diff_#{f.delete('.')}" do
    f = (f =~ /^\./) ? ('dot' + f) : f
    sh "cd #{HOME}/dev/environment/; git diff #{f}"
  end
end

# diff all files
desc 'diff all files'
task :diff do
  sh "cd #{HOME}/dev/environment/; git diff"
end

