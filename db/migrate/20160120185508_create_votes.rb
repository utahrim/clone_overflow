class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, polymorphic: true
      t.references :user, index: true
      t.integer :value, null: false
      
      t.timestamps
    end
  end
end
