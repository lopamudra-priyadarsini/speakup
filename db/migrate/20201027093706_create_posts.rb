class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.text :content
    	t.string :status
    	t.references :user_id, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
