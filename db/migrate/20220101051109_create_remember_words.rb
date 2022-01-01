class CreateRememberWords < ActiveRecord::Migration[6.1]
  def change
    create_table :remember_words do |t|
      t.boolean :can_remember
      t.boolean :marked
      t.references :user, null: false, foreign_key: true
      t.references :oxford_word, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
