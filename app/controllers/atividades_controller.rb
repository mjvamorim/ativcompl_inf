class AtividadesController < ApplicationController
  before_action :somente_autenticado
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]
  @@ativs = Atividade.where('aluno_id = 10')

  def ymd(data)
    data[6,4]+'-'+data[3,2]+'-'+data[0,2]
  end

  # GET /atividades
  # GET /atividades.json
  def index
    @ptipo= params[:ptipo].present? ? params[:ptipo] : "2"
    @paluno = params[:paluno].present? ? params[:paluno] : ""
    @pdatini = params[:pdatini].present? ? params[:pdatini] : ""
    @pdatfim = params[:pdatfim].present? ? params[:pdatfim] : ""
 
    @modalidades = Modalidade.all.order("aluno_id,created_at DESC");
    # filtro do formulário: 0-Todas, 1-Avalidadas, 2-Não avalidadas
    filtro = "1=1"
    if @ptipo.present?
      if  @ptipo ==  "1"
        filtro = filtro + " and horas_jul >= 1 "
      end
      if  @ptipo ==  "2"
        filtro = filtro + " and (horas_jul = 0 or horas_jul is null) "
      end
    end
    if @pdatini.present?
      pini = ymd(@pdatini)
      filtro = filtro + " and atividades.updated_at >= '#{pini}' "
    end
    if @pdatfim.present?
      pfim = ymd(@pdatfim)
      filtro = filtro + " and atividades.updated_at  <= '#{pfim}' "
    end

    # filtro por tipo de usuario logado
    if current_user.tipo != 'Administrador'
      if current_user.tipo == 'Aluno'
       filtro = filtro + " and aluno_id = "+ current_user.id.to_s
      else
        filtro = filtro + " and julgador_id = ? ", current_user.id
      end
    end

    if @paluno.present?
      filtro+=" and users.nome like '%#{@paluno}%'"
    end
    if params[:page]
      @atividades=Atividade.joins(:aluno).where(filtro+" and users.nome like '%#{@paluno}%'").order("users.nome, modalidade_id").paginate(page: params[:page], per_page: 50)
      session[:lastpage] = params[:page]
    else
      @atividades=Atividade.joins(:aluno).where(filtro+" and users.nome like '%#{@paluno}%'").order("users.nome, modalidade_id").paginate(page: session[:lastpage], per_page: 50)
    end
    @@ativs=Atividade.joins(:aluno).where(filtro+" and users.nome like '%#{@paluno}%'").order("users.nome, modalidade_id")
  end

  def imprimir
    @atividades = @@ativs
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AtividadesReport.new(@atividades)
        send_data pdf.render, filename: 'AtividadesListagem.pdf', :width => pdf.bounds.width,
        type: 'application/pdf', disposition: :inline, :page_size => "A4", :page_layout => :landscape
      end
    end
  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
    @atividade.julgador_id = 1
    @atividade.horas_req = 0
    if current_user.tipo == 'Aluno'
      @atividade.aluno_id = current_user.id
    end
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades
  # POST /atividades.json
  def create
    @atividade = Atividade.new(atividade_params)
    respond_to do |format|
      if @atividade.save
        @atividade.anexo = "#{@atividade.id}.pdf"
        @atividade.save
        format.html { redirect_to @atividade, notice: 'Atividade was successfully created.' }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1
  # PATCH/PUT /atividades/1.json
  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to @atividade, notice: 'Atividade was successfully updated.' }
        #format.html { redirect_to @atividade, notice: 'Atividade was successfully updated.' }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to atividades_url, notice: 'Atividade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atividade_params
      params.require(:atividade).permit(:id, :descricao, :modalidade_id, :aluno_id, :horas_req, :horas_jul, :anexo, :julgador_id)
    end
    
    def somente_autenticado
      if !current_user
        redirect_to '/'
      end
    end
end
