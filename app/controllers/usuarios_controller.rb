class UsuariosController < ApplicationController
  before_action :somente_administrador
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @ptipo= params[:ptipo].present? ? params[:ptipo] : "0"
    @pnome = params[:pnome].present? ? params[:pnome] : ""
    filtro = "1=1"
    if @ptipo.present?
      if  @ptipo ==  "1"
        filtro = filtro + " and (confirmed_at is not null) "
      end
      if  @ptipo ==  "2"
        filtro = filtro + " and (confirmed_at is null) "
      end
    end
    if @pnome.present?
      filtro+=" and nome like '%#{@pnome}%'"
    end
    @usuarios = Usuario.where(filtro).order("nome").paginate(page: params[:page], per_page: 10)
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :matricula, :curso, :tipo, :confirmed_at)
    end
    def somente_administrador
      if current_user
        if current_user.tipo != "Administrador"
          redirect_to '/'
        end
      else
        redirect_to '/'
      end
    end
end
