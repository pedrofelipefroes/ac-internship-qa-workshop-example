require 'rspec'
require 'page-object'
require 'pry'
require 'headless'
require 'colorize'
require 'data_magic'

World(PageObject::PageFactory)
PageObject.default_element_wait = 10
PageObject.default_page_wait = 60

String.disable_colorization = true if ARGV.include? 'ci'
DataMagic.yml_directory = 'config/data'
