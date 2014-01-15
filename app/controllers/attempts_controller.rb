class AttemptsController < ApplicationController
  before_action :set_attempt, only: [:show, :edit, :update, :destroy]
  before_action :check_answers, :only => :create

  # GET /attempts
  # GET /attempts.json
  def index
    @attempts = Attempt.all
  end

  # GET /attempts/1
  # GET /attempts/1.json
  def show
  end

  # GET /attempts/new
  def new
    @attempt = Attempt.new
  end

  # GET /attempts/1/edit
  def edit
  end

  # POST /attempts
  # POST /attempts.json
  def create
    if @score >= 75
      @attempt = Attempt.new(attempt_params)
    else
      redirect_to user_home_path, notice: "You did not answer enough questions correctly, your score was #{@score}."
    end
    respond_to do |format|
      if @attempt.save
        format.html { redirect_to user_home_path, notice: 'Registration was Successful.' }
        format.json { render action: 'show', status: :created, location: @attempt }
      else
        format.html { render action: 'new' }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempts/1
  # PATCH/PUT /attempts/1.json
  def update
    respond_to do |format|
      if @attempt.update(attempt_params)
        format.html { redirect_to @attempt, notice: 'Attempt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1
  # DELETE /attempts/1.json
  def destroy
    @attempt.destroy
    respond_to do |format|
      format.html { redirect_to attempts_url }
      format.json { head :no_content }
    end
  end

  private
    def check_answers
      @survey = Survey.find(1)
      @questions = @survey.questions
      @attempt.score=0
      @score = 0
      @questions.each do |question|
        answer = attempt_params[question.__id__]
        if answer.correct?
          @score += answer.weight
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attempt_params
      params.require(:attempt).permit(:user_id, :survey_id, :score)
    end
end
