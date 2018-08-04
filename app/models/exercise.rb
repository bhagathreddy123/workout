class Exercise < ApplicationRecord
  belongs_to :user
  validates :duration_in_min,:workout,:workout_date, presence: true
  validates :duration_in_min, numericality: { only_integer: true }
  validates :user_id, presence: true