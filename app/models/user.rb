class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :tackles, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  # 提案回数をチェックし、増加させるメソッド
  def can_suggest?
    suggestion_count < 3
  end

  def increment_suggestion_count
    increment!(:suggestion_count)
  end
end
