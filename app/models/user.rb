class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :tackles, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :fishing_plans, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  # 提案回数をチェックし、リセットも行う
  def can_suggest?
    reset_suggestion_count_if_needed
    suggestion_count < 3
  end

  def increment_suggestion_count
    update(last_suggestion_at: Time.current) if suggestion_count.zero?
    increment!(:suggestion_count)
  end

  private

  def reset_suggestion_count_if_needed
    return unless last_suggestion_at.nil? || last_suggestion_at < 1.day.ago

    update(suggestion_count: 0, last_suggestion_at: Time.current)
  end
end
