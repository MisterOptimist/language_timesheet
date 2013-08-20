class HomeController < ApplicationController
	before_filter :authenticate_user!

  

  def index
@users = User.all
@timesheets = current_user.timesheets.all
@hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
@khmer = Word.random.khmer
@english = Word.random.english
@khmersentence = Word.random.khmersentence
@englishsentence = Word.random.englishsentence
@name = current_user
@phonetic = Word.random.phonetics
 end

 


end
