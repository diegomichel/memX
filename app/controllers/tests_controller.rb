# Controller for tests, where tests are tests over our memorizable lists
class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @list = List.find_by_id(params['list_id'])
    @test = @list.tests.build
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create # rubocop:disable all
    @test = Test.new(test_params)
    respond_to do |format|
      if @test.save
        format.html do
          redirect_to list_test_path(@test.list, @test),
                      notice: 'Test was successfully created.'
        end
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update # rubocop:disable Metrics/MethodLength
    respond_to do |format|
      if @test.update(test_params)
        format.html do
          redirect_to @test, notice: 'Test was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html do
        redirect_to tests_url, notice: 'Test was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def test_params
    params.require(:test).permit(:list_id, :text)
  end
end
