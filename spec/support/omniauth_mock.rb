RSpec.configure do |config|
    config.before(:each) do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: 'google',
        uid: '123545',
        info: {
          email: 'test@example.com',
          name: 'Test User'
        },
        credentials: {
          token: 'mock_token',
          refresh_token: 'mock_refresh_token'
        }
      })
    end

    config.after(:each) do
      OmniAuth.config.test_mode = false
    end
end