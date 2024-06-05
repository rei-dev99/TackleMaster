# TackleMaster(タックルマスター)
釣りの楽しさは、釣り具を選ぶところから始まる！

# ■サービス概要
釣りは釣りでも、釣り道具に特化したアプリです。
機能については
- ユーザーの釣り具が登録できます。
- ユーザーの条件に合わせて最適な釣り具の提案させていただきます。

# ■ このサービスへの思い・作りたい理由
釣りにハマるということは、多くの場合、釣り具を選ぶ「沼」にも足を踏み入れることを意味します。

私自身、釣り具を選ぶ過程は楽しいものでしたが、同時にその管理が行き届かず、何を持っているのかわからなくなってしまうことがしばしばありました。
また、釣り具を選ぶためには、魚種や季節、釣り場の条件に合わせた知識が必要とされますが、これが初心者にとっては大きな壁となってしまいます。

このアプリを開発するにあたっての最大の動機は、釣りに出かける際の準備をもっと簡単に、そして楽しみながらできるようにすることです。
釣り具の選択から管理まで、このアプリがあれば、ユーザーは釣り具に関するストレスを大幅に減らすことができます。
初心者でも、どのような条件の下でどの釣り具を選べばいいのか、迷うことなく知ることができるようになります。

このサービスを通じて、釣り具選びの「楽しさ」はそのままに、「わからない」「管理が大変」といったネガティブな部分を解消し、より多くの人が釣りという趣味を楽しめるようになることを目指しています。

一人でも多く、釣りという素晴らしい趣味を全うできるよう、このアプリは釣り具の選択と管理のサポートをします。

# ■ ユーザー層について
- これから釣りを始めたい/興味を持っている方
- 釣りをやっている初心者の方
- 釣り具の管理が行き届いてない方
- 釣り具の情報をまとめたい方

# ■サービスの利用イメージ
ユーザーが自分の持っている釣り具をアプリに登録することからスタートするイメージ。
それから、ターゲットとする魚種、行きたい釣り場の種類、使いたい釣法、
予算などの条件を入力することで、アプリが最適な釣り具の組み合わせを提案。

例えば、初心者が近くの川でバス釣りをしたいけど、何を揃えたらいいかわからない場合、このアプリを使って条件を入力すると、始めるのに必要な釣り竿、リール、ルアーなどを予算内で提案してくれる。

また、すでにいくつか道具を持っている中級者は、新たに挑戦したい釣法や釣り場に合わせた道具の提案を受け、自分のコレクションにないアイテムを見つけることができる。

上級者や玄人は、特定の魚種を狙うための高度な釣り具の組み合わせを求めたり、自分の持っている釣り具を最大限活用するための提案を受けられる。

# ■ ユーザーの獲得について
- 各種SNS(X、facebook、instagram)での宣伝
- 釣り好きな友人や知人に紹介して使ってもらう
- ブログに紹介記事を投稿する
- 使ってもらった感想や改善点を元に、アプリをよくしていき、それらもSNSやブログに投稿していく
- 難易度は高いが、インフルエンサー・影響力のある人に使ってもらい、宣伝していただく

# ■ サービスの差別化ポイント・推しポイント
- **完全カスタマイズのタックル登録**: 類似のサービスでは部分的なタックル登録が可能ですが、本サービスではロッド、リール、その他を含むタックル一式を登録できます。これにより、釣り具の管理と選択を効率化し、差別化を図りたいと考えております。
- **釣り道具に特化したサポート**: 多くの釣りアプリが釣り場情報や天気予報、釣果共有に焦点を当てていますが、本サービスは釣り道具に特化しています。これによりユーザーが釣り道具を選ぶところから楽しめるよう、サポートを提供します。
- **パーソナライズされた釣具提案**: ユーザーの狙う魚種、釣り場知識、予算などを考慮し、最適な釣り具を提案します。これにより、釣り初心者から上級者まで、より多くの人が釣りを楽しめるようになります。

# ■ 機能候補
MVPリリース時に作っていたいもの
- タックル登録機能
- 最適な釣り具提案機能

本リリースまでに作っていたいもの
- 登録済みタックルの共有機能
- 共有されたタックルの一覧ページ
- 共有されたタックルの一覧ページに検索機能をつける
- 共有されたタックルの一覧ページにいいねとかお気に入り、コメントする機能
- 機種(ロッド、リール)の比較機能(作れるか怪しい)
- 最低限の知識が学べるページの追加。完全初心者だとそもそもロッドやリール、ラインとか?となってしまう可能性があるので
- MVPでの不具合やデザイン、使ってくれた人の声を元に修正して改善していく

# ■ 機能の実装方針予定
- Google認証　→ Google Identity Platform
- 最適な釣り具提案機能　→　OpenAI API
- 釣り具の提案とともに商品を表示させる → 楽天API

# ■技術スタック
- サーバーサイド：Ruby on Rails
- フロントエンド：本リリース後にReact.jsへ徐々に移行する
- cssフレームワーク：TailwindCSS、DaisyUI
- データベース：PostgreSQL
- 開発環境:Docker
- Google認証：Google Identity Platform API
- 最適な釣り具提案機能：Open AI API
- 釣り具の商品表示:楽天API
- インフラ:render
- 画像保存先:AWS S3

# ■追加サービスの案
- タックル登録画面で、入力したロッドやリールなどの画像を登録できるようにする。
- 釣りに行く予定も追加する。予定をタックル登録機能と似た感じで追加できるようにする。↓
- 主に、釣り場所(地図)、登録したタックルを追加する機能、日付を入力すると自動で予報も表示されるようにする。さらに通知機能も追加し、釣りの予定が近づいてきたらメールで通知。
- 釣り条件に最適な時期推薦機能：ユーザーが狙っている魚種や釣り場所を入力すると、過去のデータや天候予測を基に、最適な釣りの時期や時間をAIが推薦してくれる。

■技術スタック
- OpenWeatherMap APIで天気予報
- Action MailerもしくはFirebase Cloud Messagingで通知
- 楽天API
- Google Maps API

# ■「タックル登録機能に検索機能もつける」の検索機能について
タックル登録後に、自分が登録したタックルの一覧ページに格納されます。
それらを対象に検索できるようにします。
- キーワード検索：タックル名やアイテムの名前、種類を入力して検索できる基本的な機能
- カテゴリー検索：ロッド、リール、ルアーなど、各カテゴリーに分けて検索できる機能

# ■「最適な釣り具提案機能」について
ユーザーに向けて、「ターゲット魚種」、「釣り場の種類」、「釣法」、「予算」、「レベル(初心者〜上級者)」を入力してもらい、最適なタックルを一式提案する。
そこから、タックル結果のような感じで、一式表示されるようにする。
ここでOpen AI APIで結果が返されるようにする。
発展させるなら、「釣り具」の入力欄を追加して、タックル一式、ロッド、リール、ライン、ルアーなどが選べるようにして個別に提案できるようにする。

# ■画面遷移図
https://www.figma.com/file/IyTFoHXk37hss5w02hBsEs/Tackle-Master-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=WoHDNdJyvihqRo84-1

# ■ER図
```mermaid
erDiagram
  users ||--o{ tackles: "ユーザーは複数のタックルを持つ"
  tackles ||--o{ tackle_rods: "タックルに対して複数のロッドを持つ"
  rods ||--o{ tackle_rods: "ロッドに対して複数のタックルを持つ"
  tackles ||--o{ tackle_reels: "タックルに対して複数のリールを持つ"
  reels ||--o{ tackle_reels: "リールに対して複数のタックルを持つ"
  tackles ||--o{ tackle_accesories: "タックルに対して複数の小物を持つ"
  accesories ||--o{ tackle_accesories: "小物に対して複数のタックルを持つ"

  users {
    bigint id PK "ユーザーID"
    string name "ユーザー名"
    string email "メールアドレス"
    string crypted_password "暗号化パスワード"
    string salt "ソルト"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }

  tackles {
    bigint id PK "タックルID"
    bigint user_id FK "ユーザーID"
    string name "タックル名"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }

  rods {
    bigint id PK "ロッドID"
    string name "ロッド名"
    text memo "メモ"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }

  tackle_rods {
    bigint id PK "タックルロッドID"
    bigint id FK "タックルID"
    bigint id FK "ロッドID"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }

  reels {
    bigint id PK "リールID"
    string name "リール名"
    text memo "メモ"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }

  tackle_reels {
    bigint id PK "タックルリールID"
    bigint id FK "タックルID"
    bigint id FK "リールID"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }

  accesories {
    bigint id PK "小物ID"
    string name "小物名"
    text memo "メモ"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }

  tackle_accesories {
    bigint id PK "タックル小物ID"
    bigint id FK "タックルID"
    bigint id FK "小物ID"
    timestamp created_at "作成日"
    timestamp deleted_at "更新日"
  }
```