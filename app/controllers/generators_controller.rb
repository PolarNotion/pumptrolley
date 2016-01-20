class GeneratorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_generator, only: [:show, :edit, :update, :destroy]

  # GET /generators
  # GET /generators.json
  def index
    @personal_generators = current_user.generators.all
    @public_generators   = Generator.where.not(author_id: current_user.id).all
    @fizzbuzz = "morgan"
  end

  # GET /generators/1
  # GET /generators/1.json
  def show
    respond_to do |format|
      format.html
      format.rb
    end
  end

  # GET /generators/new
  def new
    @generator = current_user.generators.new
    
    if params[:dup]
      original_generator = Generator.find(params[:dup])
      @generator         = original_generator
      
      @generator.name   += " Copy"
    end
  end

  # GET /generators/1/edit
  def edit
  end

  # POST /generators
  # POST /generators.json
  def create
    @generator = current_user.generators.new(generator_params)

    respond_to do |format|
      if @generator.save
        format.html { redirect_to @generator, notice: 'Generator was successfully created.' }
        format.json { render :show, status: :created, location: @generator }
      else
        format.html { render :new }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generators/1
  # PATCH/PUT /generators/1.json
  def update
    respond_to do |format|
      if @generator.update(generator_params)
        format.html { redirect_to @generator, notice: 'Generator was successfully updated.' }
        format.json { render :show, status: :ok, location: @generator }
      else
        format.html { render :edit }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generators/1
  # DELETE /generators/1.json
  def destroy
    @generator.destroy
    respond_to do |format|
      format.html { redirect_to generators_url, notice: 'Generator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generator
      @generator = Generator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generator_params
      params.require(:generator).permit(:name,
                                        :is_private,
                                        :author_id,
                                        snippet_ids: [])
    end
end
