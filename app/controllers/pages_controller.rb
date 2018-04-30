class PagesController < ApplicationController

	layout 'admin'

	
	def new
		@page = Page.new
		@subjects = Subject.all
	end

	def create
		@page = Page.create(page_params)

		if @page.save
			flash[:notice] = "Page created."
			redirect_to(pages_path)
		else
			render('new')
		end
	end

	
	def show
		@page = Page.find(params[:id])
	end

	def index
		@pages = Page.sorted
	end

	
	def edit
		@page = Page.find(params[:id])
		
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(page_params)
			flash[:notice] = "Page updated."
			redirect_to(page_path(@page))
		else
			render('edit')
		end	
	end

	def destroy
		@page = Page.find(params[:id])
		@page.destroy
		flash[:notice] = "Page '#{@page.name}'' deleted"
		redirect_to(pages_path)
	end

	def delete
		@page = Page.find(params[:id])
	end


	private
		def page_params
			params.require(:page).permit(:name, :position, :subject, :visible)
		end

		

end
