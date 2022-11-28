# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    # DatabaseCleaner.clean_with :truncation
  end

  config.before do
    DatabaseCleaner.start
    DatabaseCleaner.strategy = :transaction
  end

  config.after do
    DatabaseCleaner.clean
  end
end
