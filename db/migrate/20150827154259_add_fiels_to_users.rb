class AddFielsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nome, :string
    add_column :users, :matricula, :string
    add_column :users, :curso, :string
    add_column :users, :tipo, :string
  end
end
