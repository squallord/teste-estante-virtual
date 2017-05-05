class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  # GET /competitions
  # GET /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  # GET /competitions/1.json
  def show
    @result = Result.new
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'A competição foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to @competition, notice: 'A competição foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  def finalize
    #byebug
    @competition = Competition.find(params[:competition_id])
  end

  def ranking
    @competition = Competition.find(params[:competition_id])
    #@result = @competition.results.create(result_params)
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @results = @competition.results
    @results.each do |result|
      result.destroy
    end
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'A competição foi apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:title, :sportType, :start, :end)
    end

    def result_params
      params.require(:result).permit(:athlete, :resultValue, :unit)
      #params.require(:result).permit!
    end
end
