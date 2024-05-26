class OpenAIService
  def self.get_chat_response(params)
    client = OpenAI::Client.new(
      access_token: ENV['OPENAI_API_KEY'],
      log_errors: true
    )

    prompt = <<~PROMPT
      あなたは釣りのプロです。以下の条件に合った釣り具を提案してください：
      狙う魚: #{params[:fish_type]}
      予算: #{params[:budget]}
      釣りの場所: #{params[:location]}
      釣りの種類: #{params[:method]}
      釣りの経験レベル: #{params[:skill_level]}
    PROMPT

    response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [{ role: "user", content: prompt }],
        max_tokens: 100
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
