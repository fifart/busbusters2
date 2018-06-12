class CreatePostings < ActiveRecord::Migration[5.1]
  def change
    create_table :postings do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
