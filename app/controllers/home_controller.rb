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
		puts(params[:beats])
		item = params[:beats].scan(/(\d+)-(\d+)/)
		puts(item)
		for i in item do
			if i[0].to_i >= 300
				phrase = " "
				if i[1].to_i == 0
					phrase = "Normal"
				end
				if i[1].to_i == 1
					phrase = "Slow"
				end
				if i[1].to_i == 2
					phrase = "Fast"
				end
				@newdata = Datapoint.new(beat: i[0], sign: phrase, recieved_at: Time.now)
				@newdata.save
				@pacemaker.datapoints << @newdata
				@pacemaker.save
			end
		end
		redirect_to("/")
	end

	def clear
		@pacemaker = Pacemaker.all.first
		@pacemaker.datapoints = []
		@pacemaker.save
		redirect_to("/")
	end

end
