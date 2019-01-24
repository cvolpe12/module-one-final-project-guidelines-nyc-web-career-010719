class CreateActorTvs < ActiveRecord::Migration[5.0]
    def change
      create_table :actor_tvs do |t|
        t.integer :tv_id
        t.integer :actor_id
      end
  end
end
