class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit,:update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
    @competitions = Competition.all
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
    @competition = Competition.find(@result.competition_id)
  end

  # POST /results
  # POST /results.json
  def create
    @competition = Competition.find(params[:competition_id])
    if @competition.sportType == "dardo"
      counter = @competition.results.where("athlete = '#{result_params[:athlete]}'").count
      if counter < 3
        @result = @competition.results.create(result_params)
        respond_to do |format|
          if @result.save(result_params)
            format.html { redirect_to competition_path(@competition), notice: 'Lançamento adicionado com sucesso!' }
            format.json { render :show, status: :ok, location: @result }
          else
            format.html { render :new }
            format.json { render json: @result.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to competition_path(@competition), notice: 'Um mesmo atleta não pode realizar mais do que 3 lançamentos!'
      end
    elsif @competition.sportType == "corrida"
      counter = @competition.results.where("athlete = '#{result_params[:athlete]}'").count
      if counter == 0
        @result = @competition.results.create(result_params)
        respond_to do |format|
          if @result.save(result_params)
            format.html { redirect_to competition_path(@competition), notice: 'Resultado adicionado com sucesso!' }
            format.json { render :show, status: :ok, location: @result }
          else
            format.html { render :new }
            format.json { render json: @result.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to competition_path(@competition), notice: 'Um mesmo atleta não pode participar de uma mesma corrida mais do que 1 vez!'
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: "O resultado do atleta #{@result.athlete} foi atualizado." }
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
      format.html { redirect_to competition_path(@result.competition_id), notice: "Resultado do atleta #{@result.athlete} foi apagado." }
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
    end
end
