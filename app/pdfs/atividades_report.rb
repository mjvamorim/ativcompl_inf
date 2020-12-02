class AtividadesReport < Prawn::Document
  
  def initialize(atividades)
    super()
    font_families.update("Arial" => {
      :normal => "#{Rails.root}/app/assets/fonts/arial.ttf",
      :bold   => "#{Rails.root}/app/assets/fonts/arial-bold.ttf",
      :italic => "#{Rails.root}/app/assets/fonts/arial-italic.ttf",
    })
    self.font "Arial"
    @qtdehoras = 0
    @atividades = atividades
    cabecalho
    corpo
    sumario
  end

  def cabecalho
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 100
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 540, :height => 50) do
      text "Coordenação de Cursos Superiores de Informática", size: 15, style: :bold
      text "Listagem de Atividades Complementares", size: 12, style: :bold
    end

   

  end

  def corpo
    # This makes a call to atividade_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths

    table atividade_rows do
      row(0).font_style = :normal
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [90,150, 250, 50]
      self.cell_style = {size: 8}
      columns(0..2).align = :left
      columns(3).align = :right
            
    end
     
  end

  def atividade_rows
    [['Matricula','Aluno', 'Atividade', 'Horas']] +
      @atividades.map do |atividade|
      [atividade.aluno.matricula,atividade.aluno.nome, atividade.descricao,  atividade.horas_jul]
      end
  end
  
  def sumario
    @atividades.each do |atividade|
     @qtdehoras += atividade.horas_jul if atividade.horas_jul
    end
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 540, :height => 50) do
          text "Total de Horas Aceitas: #{@qtdehoras} ", size: 15, style: :bold
    end
  end
  
  
  
end