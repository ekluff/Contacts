require('sinatra')
require('sinatra/reloader')
require('./lib/contacts')
require('./lib/addresses')
require('./lib/email')
require('./lib/phone')
also_reload('lib/**/*.rb')
require('pry')