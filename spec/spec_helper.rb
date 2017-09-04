require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'bing_ads_ruby_sdk'
require 'awesome_print'

require 'byebug'
require 'rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Dir[Pathname(Dir.pwd).join('spec', 'support', '**', '*.rb')].each { |f| require f }