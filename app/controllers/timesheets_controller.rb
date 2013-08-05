class TimesheetsController < ApplicationController

  load_and_authorize_resource :user
  load_and_authorize_resource :timesheet, :through => :user, :shallow => true


  # GET /timesheets
  # GET /timesheets.json
  def index
   
    @timesheets = @user.timesheets.where('day BETWEEN ? AND ?', Date.today.beginning_of_week(:sunday), Date.today.end_of_week).order('created_at DESC').page(params[:page]).per(7)
    @hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timesheets }
    end
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
    @timesheet = Timesheet.find(params[:id])

   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timesheet }
    end
  end

  # GET /timesheets/new
  # GET /timesheets/new.json
  def new
    @timesheet = Timesheet.new
 
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timesheet }
    end
  end

  # GET /timesheets/1/edit
  def edit
    @timesheet = @user.timesheets.find(params[:id])
    
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = @user.timesheets.build(params[:timesheet])
    

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to user_timesheets_path, notice: 'Timesheet was successfully created.' }
        format.json { render json: @timesheet, status: :created, location: @timesheet }
      else
        format.html { render action: "new" }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /timesheets/1
  # PUT /timesheets/1.json
  def update
    @timesheet = @user.timesheets.find(params[:id])
    @hours = @timesheet.hours_studied
    respond_to do |format|
      if @timesheet.update_attributes(params[:timesheet])
        format.html { redirect_to user_timesheet_path(@user, @timesheet), notice: 'Timesheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet = @user.timesheets.find(params[:id])
    @timesheet.destroy

    respond_to do |format|
      format.html { redirect_to user_timesheets_path }
      format.json { head :no_content }
    end
  end

   def statistics
        @timesheets = @user.timesheets.all

        respond_to do |format|
      format.html # yours.html.erb
     format.xml  { render json: @user.timesheets }
    end
  end

 def all
        @timesheets = @user.timesheets.order('created_at DESC').page(params[:page])
        @hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
        @first = @timesheets.first.day.strftime("%B %-d")
        @last = @timesheets.last.day.strftime("%B %-d")
        respond_to do |format|
      format.html # yours.html.erb
     format.xml  { render json: @user.timesheets }
    end
  end

def lastweek
        @timesheets = @user.timesheets.where(:day => 1.week.ago.beginning_of_week..1.week.ago.end_of_week).page(params[:page]).per(7)
        @hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
        @first = @timesheets.first.day.strftime("%B %-d")
        @last = @timesheets.last.day.strftime("%B %-d")
        respond_to do |format|
      format.html # yours.html.erb
     format.xml  { render json: @user.timesheets }
    end


end



 

end
