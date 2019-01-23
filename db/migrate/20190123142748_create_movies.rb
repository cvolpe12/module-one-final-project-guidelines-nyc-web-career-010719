class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.text title
      t.integer year_released
      t.integer vote_average
      t.text brief_description
  end
end
