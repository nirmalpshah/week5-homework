class ComicsController < ApplicationController

	def index
		@comics = Comic.all
	end

	def show
		cid = params["comic_id"]

		@c = Comic.find(cid)
	end

	def delete
		cid = params["comic_id"]

		c = Comic.find(cid)

		if c
			c.destroy
		end

		redirect_to '/comics'

	end

	def create
		@c = params["comic"]

		@comic = Comic.new
		@comic.title = @c["title"]
		@comic.description = @c["description"]
		@comic.image_url = @c["image_url"]

		if @comic.save
			redirect_to '/comics'
		else
			@errors = @c.errors
			render 'new'
		end

	end

	def new
		@comic = Comic.new

		@errors = []
		@comic.title = ''
		@comic.description = ''
		@comic.image_url = ''
		
	end

end
