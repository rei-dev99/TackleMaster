require 'ruby/openai'

class OpenaiService
  def self.get_chat_response(params)
    client = OpenAI::Client.new
    prompt = <<~PROMPT
      ## 指示
      あなたは釣りのプロです。"参考情報"を参考に、ユーザーに合った具体的な釣り具を「」内に提示し、500文字以内でユーザーに適した内容とアドバイスを提案してください。

      ## 参考情報
      - 狙う魚: #{params[:fish_type]}
      - 予算: #{params[:budget]}
      - 釣りの場所: #{params[:location]}
      - 釣りの種類: #{params[:method]}
      - 釣り具の種類: #{params[:tackle_type]}
      - 釣り具のメーカー: #{params[:tackle_maker]}
      - 釣りの経験レベル: #{params[:skill_level]}

      ## 制約条件
      - 出力の際は"出力フォーマット"を遵守してください。
      - ユーザーのニーズや希望をしっかりと理解し、それに基づいたアクションを提案してください。
      - 出力の際は"参考情報"も合わせて参考にしてください。
      - 具体的な釣り具名を「」に提示してから、詳細や内容を記述してください。
      - 具体的な釣り具名を提示の際には、改行せずに1行に繋げて記述してください。
      - 出力フォーマットの【】にはユーザーが入力したものを入れてください。
      - 釣り具の種類が単体の提案なら、先に釣り具の種類を提示し、タックル一式の提案なら、ロッド、リール、ライン、ルアーを提案し、その他にあったら良いものも提案してください。

      ## 出力フォーマット
      〜〜を狙う〜〜での釣りには、【メーカー名】の【釣り具の種類】は「釣り具名」を提案いたします。
      【内容とアドバイス】

      タックル一式なら改行して同様に書いてください。
    PROMPT

    response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [{ role: "user", content: prompt }], # ユーザーからのメッセージ。contentはメッセージの「内容」で、prompt変数に格納。
        max_tokens: 500
      }
    )
    # レスポンスチェック
    choices = response.dig("choices", 0, "message", "content")
    if choices # choices配列の最初のメッセージ内容を取り出す
      choices.strip
    else
      "No response from OpenAI API"
    end
  end
end
