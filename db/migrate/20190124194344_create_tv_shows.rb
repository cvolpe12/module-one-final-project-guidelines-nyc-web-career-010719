class CreateTvShows < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_shows do |t|
      t.text :title
      t.integer :year_released
      t.integer :vote_average
      t.text :brief_description
    end
  end
end
