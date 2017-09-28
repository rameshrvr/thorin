require 'spec_helper'
require 'yaml'

# Initialize file path for test yaml files
SYNTAX_CHECK_PATH = File.dirname(__FILE__) + '/syntax_check/'
USERNAME_CHECK_PATH = File.dirname(__FILE__) + '/verify_username/'

RSpec.describe 'Thorin:' do
  it 'Verification on version number' do
    expect(Thorin::VERSION).to eq '0.1.0'
  end

  describe 'Validate Syntax checks: ' do
    it 'Syntax check should PASS for Good YAML file' do
      obj = Thorin::Shield.new(SYNTAX_CHECK_PATH + 'Test1.yaml', {})
      expect(obj.syntax_check).to eq true
    end

    it 'Syntax check should FAIL for Bad YAML file' do
      obj = Thorin::Shield.new(SYNTAX_CHECK_PATH + 'Test2.yaml', {})
      expect(obj.syntax_check).to eq false
    end

    it 'Syntax check on non-existing file' do
      obj = Thorin::Shield.new(SYNTAX_CHECK_PATH + 'Something.yaml', {})
      res = false
      # Catch the exception and compare it with the message
      begin
        obj.syntax_check
      rescue RuntimeError => err
        # true if the exception matches the give string
        res = true if err.to_s.include?('File doesnot exists!!!')
      end
      expect(res).to eq true
    end

    it 'Syntax check on extension of the file' do
      obj = Thorin::Shield.new(SYNTAX_CHECK_PATH + 'Test3.yal', {})
      res = false
      begin
        obj.syntax_check
      rescue RuntimeError => err
        # true if the exception matches the give string
        res = true if err.to_s.include?('Seems the extension is not .yaml !!!')
      end
      expect(res).to eq true
    end
  end

  # Verificaion related to username stuffs
  describe 'Validate Username checks: ' do
    it 'username check in Hash of Hash structure' do
      obj = Thorin::Shield.new(USERNAME_CHECK_PATH + 'Test1.yaml', {})
      expect(obj.verify_username).to eq false
    end
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
