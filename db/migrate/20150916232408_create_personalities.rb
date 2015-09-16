class CreatePersonalities < ActiveRecord::Migration
  def change
    create_table :personalities do |t|
      t.integer :traits_score
      t.integer :types_score
      t.references :user, index: true, foreign_key: true
    end
  end
end
