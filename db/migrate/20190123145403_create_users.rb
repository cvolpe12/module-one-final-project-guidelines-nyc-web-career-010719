class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text name
      t.integer age
  end
end
