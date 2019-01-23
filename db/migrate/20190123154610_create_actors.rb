class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.text :name
    end
  end
end
