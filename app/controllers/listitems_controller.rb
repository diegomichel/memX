class ListitemsController < ApplicationController
  before_action :set_listitem, only: [:show, :edit, :update, :destroy]

  # GET /listitems
  # GET /listitems.json
  def index
    @listitems = Listitem.all
  end

  # GET /listitems/1
  # GET /listitems/1.json
  def show
  end

  # GET /listitems/new
  def new
    @listitem = Listitem.new
  end

  # GET /listitems/1/edit
  def edit
  end

  # POST /listitems
  # POST /listitems.json
  def create
    @listitem = Listitem.new(listitem_params)

    respond_to do |format|
      if @listitem.save
        format.html { redirect_to @listitem, notice: 'Listitem was successfully created.' }
        format.json { render :show, status: :created, location: @listitem }
      else
        format.html { render :new }
        format.json { render json: @listitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listitems/1
  # PATCH/PUT /listitems/1.json
  def update
    respond_to do |format|
      if @listitem.update(listitem_params)
        format.html { redirect_to @listitem, notice: 'Listitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @listitem }
      else
        format.html { render :edit }
        format.json { render json: @listitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listitems/1
  # DELETE /listitems/1.json
  def destroy
    @listitem.destroy
    respond_to do |format|
      format.html { redirect_to listitems_url, notice: 'Listitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listitem
      @listitem = Listitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listitem_params
      params.require(:listitem).permit(:text, :list_id, :previous_item_id)
    end
end
