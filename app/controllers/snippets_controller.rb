class SnippetsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]

  # GET /snippets
  # GET /snippets.json
  def index
    @personal_snippets = current_user.snippets.order(is_featured: :desc, name: :asc).all
    @public_snippets   = Snippet.where.not(author_id: current_user.id).where(is_private: false).order(is_featured: :desc, name: :asc).all
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
  end

  # GET /snippets/new
  def new
    @snippet = current_user.snippets.new

  end

  # GET /snippets/1/edit
  def edit
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = current_user.snippets.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1
  # PATCH/PUT /snippets/1.json
  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
        format.json { render :show, status: :ok, location: @snippet }
      else
        format.html { render :edit }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url, notice: 'Snippet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def verify_privacy_settings
      unless current_user and current_user.can_edit_generator(@snippet.id)
        if @snippet.is_private
          unless params[:token] and params[:token] == @snippet.privacy_token
            redirect_to root_url, notice: "The generator you're trying to access is private."
          end
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snippet_params
      params.require(:snippet).permit(:name,
                                      :description,
                                      :install_content,
                                      :followup_content,
                                      :tags,
                                      :registration_url,
                                      :documentation_url,
                                      :is_private,
                                      :parent_id,
                                      :author_id,
                                      :is_featured)
    end
end
