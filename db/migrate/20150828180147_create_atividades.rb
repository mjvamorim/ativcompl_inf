class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :descricao
      t.references :modalidade, index: true, foreign_key: true
      t.references :aluno, index: true
      t.integer :horas_req
      t.integer :horas_jul
      t.string :anexo
      t.references :julgador, index: true

      t.timestamps null: false
    end
  end
end
