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
      # Initialize object for logger
      @logger = Logger.new(STDOUT)
    end

    # Method to load YAML into a variable
    def load_yaml
      @data = YAML.load_file(@file)
    end

    # Method to check the basic syntax of the file
    def syntax_check
      # Raise if the file has a basic syntax errors
      raise 'File doesnot exists!!! Please check the path' unless File.exist? @file
      raise 'Seems the extension is not .yaml !!! Please pass valid yaml file' unless File.extname(@file).eql?('.yaml')
      begin
        YAML.load_file(@file)
      rescue => err
        # Log the rescued error message
        @logger.error('Error: '.red + err.to_s.yellow)
        return false
      end
      true
    end

    # Check the presence of 'superairlockdevtest' in YAML data and log error
    def verify_username
      # Load yaml
      load_yaml
      begin
        # Since it is a hash we need to do this initial check
        raise if @data.value?('superairlockdevtest')
        @data.each_value do |value|
          # If the value is an array, search each array for the
          # presence of 'superairlockdevtest'
          if value.is_a?(Array)
            value.map { |x| raise if x.value?('superairlockdevtest') } if value.is_a?(Hash)
            next
          end
          raise if value.is_a?(Hash) && value.value?('superairlockdevtest')
        end
      rescue RuntimeError
        @logger.error('Error: '.red + "Usage of 'superairlockdevtest' in YAML is deprecated".yellow)
        return false
      end
      true
    end
  end
end
