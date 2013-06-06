class TracksController < ApplicationController

	def index
		@tracks = Track.all
	end

	def show
		@track = Track.find(params[:id])
		@album = @track.album
		@band = @album.band
	end

	def create
		@track = Track.create([params[:track]])
		if @track.save
			redirect_to track_url(@track)
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid track name."
			redirect_to new_track_url
		end
	end

	def new
	end

	def update
		@track = Track.find(params[:id])
		if @track.update_attributes(params[:track])
			redirect_to track_url(@track)
		else
			flash[:errors] ||= []
			flash[:errors] << "Track update unsuccessful."
			redirect_to edit_track_url
		end
	end

	def edit
	end

	def destroy
		Track.find(params[:id]).destroy
		render :index
	end

end
