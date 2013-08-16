class HomeController < ApplicationController
	before_filter :authenticate_user!

  

  def index
@users = User.all
@timesheets = current_user.timesheets.all
@hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
 end

 


end
