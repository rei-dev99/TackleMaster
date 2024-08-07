# 🎣 TackleMaster(タックルマスター) 🎣

釣り道具に特化したサービスで釣り道具の管理・登録・検索ができます。

![釣り具のサービス ](https://github.com/user-attachments/assets/30e4ddf0-ea2f-4cef-b41a-74db899fa290)

## 🐟 サービスURL 🐟

Googleログインが可能で、すぐに利用することができます。

### [🐠 Tackle Master(タックルマスター) 🐠](https://tacklemaster.net/)

## 🐟 サービス概要 🐟
釣りは釣りでも、釣り道具に特化したアプリです。

機能については
- これから釣りを始めたい方でも釣りや釣り道具について知ることができます。
- ユーザーの釣り具が登録できます。
- ユーザーの条件に合わせて釣り道具を提案させていただきます。

### 🐠 Qiita記事 🐠
[【個人開発】釣り具の登録、管理、検索ができるアプリを開発しました🎣](https://qiita.com/rei-dev99/items/befcace8fbb9bd7b5274)

## 🐟 サービスへの思い・作りたい理由 🐟
私は、釣りが好きで、釣り道具を眺めるのも大きな楽しみの一つです。

しかし、釣り具の管理が行き届かない時があったり、新しい釣りを始める際にも釣り具の選び方がわからない時がありました。

そこで、釣り具の管理に加えて、楽しく釣り道具を探せるアプリを作りたいと思いました。
このアプリを通じて、釣りに出かける際の確認に使ったり、提案機能で見つけた釣り具をもとに、釣具を楽しく探せたら良いと思っています。

## 🐟 メインターゲットユーザー層について 🐟
- これから釣りを始めたい/興味を持っている方
- 釣り具の管理が行き届いてない方

## 🐟 サービスの利用イメージ 🐟
### 🐠 初心者 🐠
ユーザーが釣り道具(タックル)というものを知るために、「釣り入門」ページを眺めるところからスタートします。
それから、ターゲットとする魚種、行きたい釣り場の種類、使いたい釣法、予算などの条件を入力することで、釣り具の提案を受けます。

#### 🐡 タックルとは 🐡

＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

釣りのための**道具一式**のことを指します。ロッド(釣竿)、リール、ライン(糸)、ルアー(擬似)、仕掛け、エサなどこれら一式指します。狙う魚や釣り方によってタックルは変わります。

タックル例1：狙う魚「アジ、サバ、イワシ」釣り方「サビキ釣り」

ロッド：7~8ftのスピニングロッド、リール：2500〜3000番のスピニングリール、ライン：peライン、ナイロンライン

タックル例2：狙う魚「イナダ、サワラ」釣り方「ルアーフィッシング」

ロッド：9〜10ftのスピニングロッド、リール：4000〜6000番のスピニングリール、ライン：peライン2~3号200m以上、ルアー：40〜60gのメタルジグ

タックル例3：狙う魚「ブラックバス」釣り方「ルアーフィッシング」

ロッド：7〜8ftのベイトロッド、リール：ベイトリール、ライン：ナイロン、peライン、ルアー：ワーム、クランクベイト

＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

### 🐠 中級者以降 🐠
また、すでにいくつか釣り道具を持っている中級者は、新たに挑戦したい釣法や釣り場に合わせた道具の提案を受け、自分のコレクションにないアイテムを見つけることができます。

上級者は、特定の魚種を狙うための高度な釣り具の組み合わせを求めたり、自身の持っている釣り具を管理することができます。

## 🐟 機能一覧 🐟

- ユーザー登録/ログイン機能/Googleログイン機能
- パスワードリセット機能
- 釣り入門ページ
- 釣り具の提案機能
  - メモのみ編集可能
  - Open AI APIによるプロンプト生成
  - 楽天APIによる商品表示
- タックル登録機能(CRUDアクション)
  - ロッド登録機能(CRUDアクション)
  - リール登録機能(CRUDアクション)
  - 小物機能(CRUDアクション)
- 画像登録/プレビュー機能
- レスポンシブ対応

### 🐠 「釣り具提案機能」について 🐠

ユーザーに「狙う魚」、「予算」、「釣りの場所」、「釣りの種類」、「釣りの経験レベル(初心者〜上級者)」、「釣り具の種類(ロッド、リール、ライン、ルアー、タックル一式)」、「メーカー(各種選択)」を入力してもらい、最適なタックルを一式提案します。Open AI APIにより結果が返されるようにします。

### 🐠 「釣り具登録機能」について 🐠

まずは、「タックル名」と「画像選択(任意)」をしてタックルを作成します。作成したタックルにお好きな分「ロッド」「リール」「小物」を追加してください。これらは、「商品名」、「メーカー」、「画像選択(任意)」、「メモ(任意)」を入力することで追加できます。

## 🐟 機能紹介 🐟

| 釣り入門ページ | スムーススクロール・ページトップへ戻るボタン|
|:---:|:---:|
|[![Image from Gyazo](https://i.gyazo.com/e71588ebf79b6952cc090fc2c191bafb.jpg)](https://gyazo.com/e71588ebf79b6952cc090fc2c191bafb)|[![Image from Gyazo](https://i.gyazo.com/17d934ab76b3909afaad6cc41c90eb11.gif)](https://gyazo.com/17d934ab76b3909afaad6cc41c90eb11)|
| 初心者はここから。釣り道具や釣りに関する知識を深めましょう。 | 目次から知りたい情報にアクセスできます。また、右下のボタンからページトップに戻ることができます。|

<br/>

| 釣り具提案機能 |
|:---:|
|[![Image from Gyazo](https://i.gyazo.com/62d6f001fb5493c76bb9b694805e198f.gif)](https://gyazo.com/62d6f001fb5493c76bb9b694805e198f)|
| 狙う魚、予算、釣りの場所、釣りの種類、釣りの経験レベル、釣り具の種類、メーカーを入力してください。あなたに最適な釣り具を提案し、関連する商品も紹介します。いろんな釣り具に出会いましょう！提案は1日3回まで受けることができます。 |
|[![Image from Gyazo](https://i.gyazo.com/5bd35e9423a1eed96359574c59f01253.gif)](https://gyazo.com/5bd35e9423a1eed96359574c59f01253)|
| 提案内容は保存されるので、随時見返すことが可能です。 |

<br/>

| 釣り具登録機能 |
|:---:|
| [![Image from Gyazo](https://i.gyazo.com/ba759856d7ad1fae0d441b843cbddd2a.gif)](https://gyazo.com/ba759856d7ad1fae0d441b843cbddd2a) |
| タックルを作成し、そこにロッド、リール、小物を自由に追加してください。お好みのタックルを作りましょう！画像の登録は任意で、なければデフォルトの画像が設定されます。スマホからの利用をおすすめします。 |
|[![Image from Gyazo](https://i.gyazo.com/781879d225c85104f4596b4a82fab2b3.gif)](https://gyazo.com/781879d225c85104f4596b4a82fab2b3)|
| 作成したタックルに、ロッド、リール、小物お好きな分追加してください。こちらも画像登録は任意で、なければデフォルトの画像が設定されます。|
|[![Image from Gyazo](https://i.gyazo.com/5ca47d1d4b654c12ca6779f9fee1219b.jpg)](https://gyazo.com/5ca47d1d4b654c12ca6779f9fee1219b) |
| タックル一覧ページから登録している各タックルに登録しているロッド、リール、小物の数が確認できます。 |

## 🐟 今後の展望 🐟
- 機能のブラッシュアップ
- RSpecテスト実装

## 🐟 技術構成 🐟
### 🐠 使用技術 🐠
| カテゴリ |　使用技術　|
|:-------|:-------|
|バックエンド|Ruby 3.2.3 ・ Ruby on Rails 7.1.3.4|
|フロントエンド|JavaScript|
|CSSフレームワーク|TailwindCSS ・ daisyUI|
|Web API|OpenAI API(GPT-4o) ・ Rakuten API|
|データベース|PostgreSQL|
|環境構築|Docker|
|インフラ|Render ・ AWS S3|
|認証|Sorcery ・ Google OAuth|


## 🐟 画面遷移図 🐟
https://www.figma.com/file/IyTFoHXk37hss5w02hBsEs/Tackle-Master-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=WoHDNdJyvihqRo84-1

## 🐟 ER図 🐟
```mermaid
erDiagram
  users ||--o{ fishing_suggestion: "ユーザーは複数の釣り具提案内容を持つ"
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
    timestamp updated_at "更新日"
  }

  fishing_suggestion {
    bigint id PK "釣り具提案ID"
    bigint user_id FK "ユーザーID"
    string fish_type "狙う魚種"
    string budget "予算"
    string location "釣りの場所"
    string fishing_type "釣りの種類"
    string skill_level "釣りの経験レベル"
    string tackle_type "釣り具の種類"
    string maker "メーカー"
    text suggestion "提案内容"
    text memo "メモ"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

  tackles {
    bigint id PK "タックルID"
    bigint user_id FK "ユーザーID"
    string name "タックル名"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

  rods {
    bigint id PK "ロッドID"
    string name "ロッド名"
    string maker "メーカー名"
    text memo "メモ"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

  tackle_rods {
    bigint id PK "タックルロッドID"
    bigint id FK "タックルID"
    bigint id FK "ロッドID"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

  reels {
    bigint id PK "リールID"
    string name "リール名"
    string maker "メーカー名"
    text memo "メモ"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

  tackle_reels {
    bigint id PK "タックルリールID"
    bigint id FK "タックルID"
    bigint id FK "リールID"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

  accesories {
    bigint id PK "小物ID"
    string name "小物名"
    string maker "メーカー名"
    text memo "メモ"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

  tackle_accesories {
    bigint id PK "タックル小物ID"
    bigint id FK "タックルID"
    bigint id FK "小物ID"
    timestamp created_at "作成日"
    timestamp updated_at "更新日"
  }

```
