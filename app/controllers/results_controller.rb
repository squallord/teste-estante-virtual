class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit,:update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  def create
    @competition = Competition.find(params[:competition_id])
    if @competition.sportType == "dardo"
      counter = @competition.results.where("athlete = '#{result_params[:athlete]}'").count
      if counter < 3
        noticeMessage = 'Lançamento adicionado com sucesso!'
        @result = @competition.results.create(result_params)
      else
        noticeMessage = 'Um mesmo atleta não pode realizar mais do que 3 lançamentos!'
      end
    elsif @competition.sportType == "corrida"
      counter = @competition.results.where("athlete = '#{result_params[:athlete]}'").count
      if counter == 0
        noticeMessage = 'Resultado adicionado com sucesso!'
        @result = @competition.results.create(result_params)
      else
        noticeMessage = 'Um mesmo atleta não pode participar de uma mesma corrida mais do que 1 vez!'
      end
    end
    redirect_to competition_path(@competition), notice: noticeMessage
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    #@competition = Competition.find(params[:competition_id])
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:athlete, :resultValue, :unit)
      #params.require(:result).permit!
    end
end
