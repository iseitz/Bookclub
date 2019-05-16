RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :feature
end
