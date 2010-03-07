require 'rubygems'
require 'extensions'
require 'page'

%w(git maruku).each do |gem|
  require_gem_with_feedback gem
end

GIT_REPO = File.expand_path( ENV['WIKI_HOME'] || (File.expand_path(File.dirname(__FILE__)) + '/deploy/var/repo') )
HOMEPAGE = 'index' # default homepage for every directory
PAGE_FILE_EXT = ".page" # file extension
ATTACH_DIR_SUFFIX = "_files"
HTML_EXT = '.html'

# check if the repo already exists, if not create a repo, a default file and a first commit.
unless File.exists?(GIT_REPO) && File.directory?(GIT_REPO)
  puts "Initializing repository in #{GIT_REPO}..."
  Git.init(GIT_REPO)
  File.open(GIT_REPO + "/" + HOMEPAGE + PAGE_FILE_EXT, 'w') { |f| f.puts "Welcome to git-wiki!" } # write something to the default index file with default extension
  g = Git.open(GIT_REPO)
  g.add(HOMEPAGE + PAGE_FILE_EXT)
  g.commit("Initial commit for automatically created git-wiki repo.")
end

$repo = Git.open(GIT_REPO)