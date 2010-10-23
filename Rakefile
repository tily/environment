
# config
HOME  = ENV['HOME']
FILES = ['Rakefile', '.bashrc', '.zshrc', '.vimrc', '.screenrc']

# deploy files

# deploy all files
desc 'deploy all files'
task 'deploy' do
  FILES.each do |f|
    source = (f =~ /^\./) ? ('dot' + f) : f
    FileUtils.ln_s "#{HOME}/dev/environment/#{source}", "#{HOME}/#{f}"
  end
end

# diff all files
desc 'diff all files'
task :diff do
  sh "cd #{HOME}/dev/environment/; git diff"
end

