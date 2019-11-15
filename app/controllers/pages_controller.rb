class PagesController < ApplicationController
    def index
        @pages = Page.all
    end

    def show
        @page = Page.find(params[:id])
    end

    def new
        @page = Page.new
    end

    def create
        @page = Page.new(page_params)
        if @page.save
            redirect_to @page, notice: 'Page has been created'
        else
            render :new
        end
    end

    def edit
        @page = Page.find(params[:id])
    end

    def update
        @page = Page.find(params[:id])
        if @page.update(page_params)
            redirect_to @page
        else
            render :edit
        end
    end

    def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to pages_path, notice: 'Page has been deleted'
    end

    private

    def page_params
        params.require(:page).permit(:title, :description)
    end

end
