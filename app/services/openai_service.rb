class OpenAIService
  def self.get_chat_response(message)
    client = OpenAI::Client.new(
      access_token: ENV['OPENAI_API_KEY'],
      log_errors: true
    )
    response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [{ role: "user", content: message }],
        max_tokens: 50
      }
    )

    Rails.logger.info("OpenAI API Response: #{response}")

    choices = response.dig("choices", 0, "message", "content")
    if choices
      choices.strip
    else
      "No response from OpenAI API"
    end
  rescue StandardError => e
    Rails.logger.error("OpenAI API error: #{e.message}")
    "Error: Unable to get response from OpenAI API"
  end
end
