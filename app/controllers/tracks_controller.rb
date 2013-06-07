class TracksController < ApplicationController

	before_filter :current_user

	def index
		@tracks = Track.all
	end

	def show
		@track = Track.find(params[:id])
		@album = @track.album
		@band = @album.band
		@notes = @track.notes
	end

	def create
		@track = Track.create(params[:track])
		if @track.save
			redirect_to track_url(@track)
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid track name."
			redirect_to new_track_url
		end
	end

	def new
		@albums = Album.all
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
		@albums = Album.all
		@track = Track.find(params[:id])
	end

	def destroy
		@track = Track.find(params[:id])
		@album = @track.album
		@track.destroy
		redirect_to album_url(@album)
	end

end
