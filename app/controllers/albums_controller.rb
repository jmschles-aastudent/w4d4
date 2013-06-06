class AlbumsController < ApplicationController

	def index
		@albums = Album.all
	end

	def show
		@bands = Band.all
		@album = Album.find(params[:id])
		@tracks = @album.tracks# .sort_by { |track| track.ord }
		@band = Band.find(@album.band_id)
	end

	def create
		@bands = Band.all
		@album = Album.create(params[:album])
		if @album.save
			redirect_to album_url(@album)
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid album name."
			redirect_to new_album_url
		end
	end

	def new
		@bands = Band.all
	end

	def update
		@album = Album.find(params[:id])
		if @album.update_attributes(params[:album])
			redirect_to album_url(@album)
		else
			flash[:errors] ||= []
			flash[:errors] << "Album update unsuccessful."
			redirect_to edit_album_url(@album)
		end
	end

	def edit
		@bands = Band.all
		@album = Album.find(params[:id])
	end

	def destroy
		@album = Album.find(params[:id])
		@tracks = @album.tracks
		@band = @album.band
		@album.destroy
		redirect_to band_url(@band)
	end

end
