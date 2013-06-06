class BandsController < ApplicationController

	def index
		@bands = Band.all
	end

	def show
		@band = Band.find(params[:id])
		@albums = @band.albums
	end

	def create
		@band = Band.create([params[:band]])
		if @band.save
			redirect_to band_url(@band)
		else
			flash[:errors] ||= []
			flash[:errors] << "Invalid band name."
			redirect_to new_band_url
		end
	end

	def new
	end

	def update
		@band = Band.find(params[:id])
		if @band.update_attributes(params[:band])
			redirect_to band_url(@band)
		else
			flash[:errors] ||= []
			flash[:errors] << "Band update unsuccessful."
			redirect_to edit_band_url(@band)
		end
	end

	def edit
		@band = Band.find(params[:id])
		render :edit
	end

	def destroy
		Band.find(params[:id]).destroy
		render :index
	end

end
