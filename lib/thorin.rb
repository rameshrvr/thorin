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

    # Method to load YAML into a variable
    def load_yaml
      @data = YAML.load_file(@file)
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
        @logger.error('Error: '.red + err.to_s.yellow)
        return false
      end
      true
    end

    # Recrusive method to check weather the YAML has username 'superairlockdevtest' or not
    # It will iterate all nested hashes and check for the entry
    #
    # @param data [Hash] Hash needs to be iterated
    #
    # @return [Boolean] True if it found one, none otherwise
    def check_username(data:)
      data.each do |key, value|
        return true if value.has_value?('superairlockdevtest')
      end
    end

    # Check the presence of 'superairlockdevtest' in YAML data and log error
    def verify_username
      load_yaml
      if check_username(data: @data)
        @logger.error('Error: '.red + "'superairlockdevtest' should not exist in YAML".yellow)
      end
    end
  end
end
