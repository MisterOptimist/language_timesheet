class HomeController < ApplicationController

  

  def index
@users = User.all
@timesheets = current_user.timesheets.all
@hours = @timesheets.sum{|p| p.teacher + p.conversation + p.study}
@khmer = Word.random.khmer
@english = Word.random.english
@khmersentence = Word.random.khmersentence
@englishsentence = Word.random.englishsentence
@phonetic = Word.random.phonetic
@english_phonetic = Word.random.english_phonetic
@name = current_user
 end

 def home
 end


end
