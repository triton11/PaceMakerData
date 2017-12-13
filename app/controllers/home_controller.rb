class HomeController < ApplicationController
	def index
		@pacemaker = Pacemaker.all.first
		puts(@pacemaker)
		puts("HELLO")
		if @pacemaker == nil
			@pacemaker = Pacemaker.new()
		end
		@data = @pacemaker.datapoints.all
		#puts(@data.first.recieved_at)
	end

	def addPoint
		@pacemaker = Pacemaker.all.first
		@newdata = Datapoint.new(beat: params[:beats], recieved_at: Time.now)
		@newdata.save
		@pacemaker.datapoints << @newdata
		@pacemaker.save
		redirect_to("/")
	end

	def clear
		@pacemaker = Pacemaker.all.first
		@pacemaker.datapoints = []
		@pacemaker.save
		redirect_to("/")
	end

end
