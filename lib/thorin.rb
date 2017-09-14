require 'thorin/version'
require 'logger'
require 'colorize'

# Source code for this gem
module Thorin
  # Sample class
  class Shield
    # initialize variables
    def initialize(file, config)
      @file = file
      @config = config
    end

    # Method to check the basic syntax of the file
    def syntax_check
      raise 'File doesnot exists!!! Please check the path' unless File.exist? @file
      raise 'Seems the extension is not .yaml !!! Please pass valid yaml file' unless File.extname(@file).eql?('.yaml')
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::WARN
      begin
        YAML.load_file(@file)
      rescue => err
        logger.error('Error: '.red + err.yellow)
        return false
      end
      true
    end

    # Method to check weather the YAML has username 'superairlockdevtest' or not
    def check_username
    end
  end
end
