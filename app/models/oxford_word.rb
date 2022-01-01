class OxfordWord < ApplicationRecord
    has_many :remember_words
    has_many :users, through: :remember_words
  end
  