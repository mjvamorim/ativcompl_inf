class CreateModalidades < ActiveRecord::Migration
  def change
    create_table :modalidades do |t|
      t.string :titulo
      t.integer :limite

      t.timestamps null: false
    end
  end
end
