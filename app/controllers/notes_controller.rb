class NotesController < ApplicationController

	def create
		@note = Note.new(params[:note])
		if @note.save
			@track = @note.track
			redirect_to track_url(@track)
		else
			flash[:errors] ||= []
			flash[:errors] << "Bad note!"
			render :back
		end
	end

	def destroy
		@note = Note.find(params[:id])
		@track = @note.track
		@note.destroy
		redirect_to track_url(@track)
	end

end
