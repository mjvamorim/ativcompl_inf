class AddFieldsToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :confirmed_at, :datetime
  end
end
