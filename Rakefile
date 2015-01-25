# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'ci/reporter/rake/rspec'

Rails.application.load_tasks

namespace :db do 
	namespace :test do 
		task :load do 
			db_config = Rails.application.config.database_configuration['test']
			sh "mysql -h #{db_conf['host']} -u#{db_config['username']} -p#{db_config['password']} \ #{db_config['database']} < ../mysql_qa7_qms_pro.sql"
		end
	end
end
