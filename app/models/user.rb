class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #layout "Users"
  devise :invitable, :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
        #:confirmable,
  has_many :atividades_alunos, :class_name => 'Atividade', :foreign_key => 'aluno_id'
  has_many :atividades_julgadores, :class_name => 'Atividade', :foreign_key => 'julgador_id'

 
end


