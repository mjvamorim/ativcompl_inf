class Usuario < ActiveRecord::Base
  self.table_name = "users"
  validates_presence_of :nome, :email, :curso, :matricula, :confirmed_at
end
