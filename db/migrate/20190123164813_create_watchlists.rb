class CreateWatchlists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.integer :user_id
      t.integer :movie_id
      t.text :movie_title
      t.integer :tv_id
      t.text :tv_show_title
    end
  end
end
