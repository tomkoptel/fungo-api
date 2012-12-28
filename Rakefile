#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Trans::Application.load_tasks


require 'bengler_test_helper/tasks'

ROOT = "#{File.dirname(__FILE__)}" unless defined?(ROOT)

settings = YAML.load(File.read("#{ROOT}/config/database.yml"))
name = settings['development']['username']

namespace :db do

  desc "bootstrap db user, recreate, run migrations"
  task :bootstrap do
    `createuser -sdR #{name}`
    `createdb -O #{name} #{name}_development`
    `createdb -O #{name} #{name}_test`
    Rake::Task['db:migrate'].invoke
  end

  task :migrate do
    Rake::Task["db:structure:dump"].invoke
  end

  desc "nuke db, recreate, run migrations"
  task :nuke do
    `dropdb #{name}_development`
    `createdb -O #{name} #{name}_development`
    Rake::Task['db:migrate'].invoke
  end

  desc "add seed data to database"
  task :seed do
    require_relative "#{ROOT}/db/seeds"
  end

end
