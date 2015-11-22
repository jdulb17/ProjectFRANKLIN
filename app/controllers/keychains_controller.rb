class KeychainsController < ApplicationController

  before_action :set_keychain, only: [:show, :edit, :update, :destroy]

  # GET /keychains
  def index
    @keychains = Keychain.all
  end

  # GET /keychains/1
  def show
    @keychain = Keychain.find params[:id]
    @user = @keychain.user
  end

  # GET /keychains/new
  def new
    @keychain = Keychain.new
    @user = @keychain.user
  end

  # GET /keychains/1/edit
  def edit
  end


  # POST /keychains
  # POST /keychains.json
  def create
    @keychain = Keychain.new(keychain_params)
    @keychain.user = current_user
    respond_to do |format|
      if @keychain.save
        format.html { redirect_to @keychain, notice: 'Key was successfully created.' }
        format.json { render :show, status: :created, location: @keychain }
      else
        format.html { render :new }
        format.json { render json: @keychain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keychains/1
  # PATCH/PUT /keychains/1.json
  def update
    respond_to do |format|
      if @keychain.update(keychain_params)
        format.html { redirect_to @keychain, notice: 'Keychain was successfully updated.' }
        format.json { render :show, status: :ok, location: @keychain }
      else
        format.html { render :edit }
        format.json { render json: @keychain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keychains/1
  # DELETE /keychains/1.json
  def destroy
    @keychain.destroy
    respond_to do |format|
      format.html { redirect_to keychains_url, notice: 'Key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keychain
      @keychain = Keychain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keychain_params
      params.require(:keychain).permit(:keyname, :keyval)
    end
end
