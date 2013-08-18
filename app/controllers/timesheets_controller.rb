class TimesheetsController < ApplicationController

  load_and_authorize_resource :user
  load_and_authorize_resource :timesheet, :through => :user, :shallow => true

  # GET /timesheets
  # GET /timesheets.json
  def index
    #User Timesheets for just that current week
    @timesheets = @user.timesheets.where('day BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week).order('created_at DESC').page(params[:page]).per(7)
    #Hour calculator
    @hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
    #Progress bar for Staff
    @progresshours = @hours * 10
    #Progress bar for New Staff
    @progresshoursnewstaff = @hours * 6.666666.round(2) 
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
        @timesheet.create_activity :create, owner: current_user
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
    #Hour Calculator
    @hours = @timesheet.hours_studied
    respond_to do |format|
      if @timesheet.update_attributes(params[:timesheet])
        @timesheet.create_activity :update, owner: current_user
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
        #User Timesheets for past 3 months(this is for the graph)
        @timesheets = @user.timesheets.where('day BETWEEN ? AND ?', Date.today - 3.months, Date.today).order('created_at DESC').page(params[:page]).per(90)
        @users = User.all
        respond_to do |format|
      format.html # yours.html.erb
     format.xml  { render json: @user.timesheets }
    end
  end

 def all
        #View all timesheets created forever
        @timesheets = @user.timesheets.order('created_at DESC').page(params[:page])
        #Hour calculator
        @hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
        #Grabs the first date with timesheets
        @first = @timesheets.first.day.strftime("%B %-d")
        #Grabs the last date with timesheets
        @last = @timesheets.last.day.strftime("%B %-d")
        respond_to do |format|
      format.html # yours.html.erb
     format.xml  { render json: @user.timesheets }
    end
  end

def lastweek
        #View timesheets from last week only
        @timesheets = @user.timesheets.where('day BETWEEN ? AND ?', 1.week.ago.beginning_of_week, 1.week.ago.end_of_week).order('created_at DESC').page(params[:page]).per(7)

        #Hour calculator
        @hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
        #Progress bar for Staff
        @progresshours = @hours * 10
        #Progress bar for New Staff
        @progresshoursnewstaff = @hours * 6.666666.round(2) 
        #Grabs the first date with timesheets
        @first = @timesheets.first.day.strftime("%B %-d")
        #Grabs the last date with timesheets
        @last = @timesheets.last.day.strftime("%B %-d")
        respond_to do |format|
      format.html # yours.html.erb
     format.xml  { render json: @user.timesheets }
    end
end





 

end
