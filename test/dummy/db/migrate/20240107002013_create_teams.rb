class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :title
      t.boolean :is_personal

      t.timestamps
    end
  end
end
