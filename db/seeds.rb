# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 user = CreateAdminService.new.call
 puts 'CREATED ADMIN USER: ' << user.email
modalidade_list = [
  ['Atividade de monitoria',152],
  ['Atividade de iniciação científica ou equivalente',150],
  ['Autor ou co-autor de capítulo de livro-50h',100],
  ['Autor ou co-autor de  livro-120h por livro',100],
  ['Certificação profissional na área do Curso-30h por certificação',90],
  ['Debatedor em mesa-redonda ou similar',70],
  ['Disciplina não aproveitada como créditos no Curso',180],
  ['Estágio não obrigatório de no minimo - 60 Horas',152],
  ['Exercício de cargo eletivo na diretoria do DCE ou do CA do Curso-20h',20],
  ['Ministrante de curso de extensão',70],
  ['Ministrante de palestra',70],
  ['Participação em banca de trabalho de conclusão de curso ',10],
  ['Participação em comissão organizadora de evento e similar-10h por evento',30],
  ['Participação em concurso acadêmico-10h por Inscrição e 30h por Premiação',80],
  ['Participação em cursos/mini-cursos',125],
  ['Participação em eventos',50],
  ['Participação em equipe esportiva do IFF-20h por semestre',40],
  ['Participação em Workshops',125],
  ['Publicação de artigo científico completo-50h por artigo',150],
  ['Publicação de artigo científico-30h por artigo',90],
  ['Publicação de produção autoral-20h por produção',60],
  ['Resumo em anais de evento científico como autor ou co-autor- 30h por artigo',90],
  ['Serviço voluntário de caráter sócio comunitário',70],
  ['Realização de curso de idioma',125]
]

modalidade_list.each do |tit, lim|
  Modalidade.create( titulo: tit, limite: lim )
end

