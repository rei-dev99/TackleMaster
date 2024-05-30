# RWS_APPLICATION_ID = ENV['RWS_APPLICATION_ID']

RakutenWebService.configure do |c|
    c.application_id = ENV['RWS_APPLICATION_ID'] # 環境変数から読み込む
end
