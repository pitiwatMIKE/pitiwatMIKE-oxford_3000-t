class RememberWord < ApplicationRecord
    validates_uniqueness_of :oxford_word_id
    belongs_to :user
    belongs_to :oxford_word
  end
  