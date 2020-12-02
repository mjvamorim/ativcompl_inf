class Atividade < ActiveRecord::Base
  validates_presence_of :descricao, :modalidade, :aluno, :horas_req, :julgador, :anexo
  belongs_to :modalidade
  belongs_to :aluno , :class_name => 'User'
  belongs_to :julgador, :class_name => 'User'
  mount_uploader :anexo, AnexoUploader
  
end
