class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :user_name
      t.text :password
      t.integer :age
    end
  end
end
