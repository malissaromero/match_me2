class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :assessment_id
      t.string :name
      t.string :photo_url
    end
  end
end
