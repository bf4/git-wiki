require 'rubygems'
require 'extensions'
require 'page'

%w(git maruku).each do |gem|
  require_gem_with_feedback gem
end

GIT_REPO = File.expand_path( ENV['WIKI_HOME'] || (File.expand_path(File.dirname(__FILE__)) + '/deploy/var/repo') )
HOMEPAGE = 'index'
PAGE_FILE_EXT = ".page"
ATTACH_DIR_SUFFIX = "_files"
HTML_EXT = '.html'

unless File.exists?(GIT_REPO) && File.directory?(GIT_REPO)
  puts "Initializing repository in #{GIT_REPO}..."
  Git.init(GIT_REPO)
end

$repo = Git.open(GIT_REPO)
