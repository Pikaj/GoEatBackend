class City < ActiveRecord::Base

	def index
		render :json => City.all
	end
end
