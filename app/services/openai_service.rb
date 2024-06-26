require 'ruby/openai'

class OpenaiService
  def self.get_chat_response(params)
    client = OpenAI::Client.new
    # プロンプト生成
    prompt = <<~PROMPT
      あなたは釣りのプロです。以下の条件に合った釣り具を200文字以内で提案してください：
      狙う魚: #{params[:fish_type]}
      予算: #{params[:budget]}
      釣りの場所: #{params[:location]}
      釣りの種類: #{params[:method]}
      提案する釣り具の種類: #{params[:tackle_type]}
      提案するメーカー: #{params[:tackle_maker]}
      釣りの経験レベル: #{params[:skill_level]}
    PROMPT

    response = client.chat(
      parameters: {
        model: "gpt-4o",
        # roleはメッセージの「役割」を表している。この場合は「user」（ユーザー）としており、ユーザーからのメッセージであることを示している。contentはメッセージの「内容」を表しており、promptという変数に格納される。
        messages: [{ role: "user", content: prompt }],
        max_tokens: 500
      }
    )
    # レスポンスチェック
    choices = response.dig("choices", 0, "message", "content")
    if choices # choices配列の最初のメッセージ内容を取り出している
      choices.strip # 存在する場合は、内容をトリムして返す
    else
      "No response from OpenAI API" # 存在しない場合は、"No response from OpenAI API"というメッセージを返す
    end
  end
end
