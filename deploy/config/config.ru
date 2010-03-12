APP_HOME = '/path/to/git-wiki'
SINATRA_PATH = 'sinatra/lib/sinatra' # relative to APP_HOME
APP = 'git-wiki' # relative to APP_HOME

# uncomment if you don't want to use the default repo location ( git-wiki/deploy/var/repo )
# ENV['WIKI_HOME'] = '/path/to/repo'

$LOAD_PATH.unshift APP_HOME
require SINATRA_PATH

Sinatra::Application.default_options.merge!(
  :raise_errors => false,
  :run => false,
  :root => APP_HOME,
  :views => APP_HOME + '/views',
  :public => APP_HOME + '/public',
  :env => :production
)

require APP
run Sinatra.application


