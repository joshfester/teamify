class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.references :team, null: false, foreign_key: true
      t.references :from_membership, null: false, foreign_key: {to_table: :memberships}

      t.timestamps
    end
  end
end
