require 'openai' # openaiというライブラリを読み込み

OpenAI.configure do |config|
  config.access_token = ENV['OPENAI_API_KEY'] # OpenAIのAPIキーが設定
end
