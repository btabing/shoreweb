class PagesController < ApplicationController
  uses_tiny_mce :options => {
                  :theme => "advanced",
                  :plugins => %w{ table },
                  :theme_advanced_buttons1 => TINYMCE_CONFIG['theme_advanced_buttons1'],
                  :theme_advanced_buttons2 => TINYMCE_CONFIG['theme_advanced_buttons2'],
                  :theme_advanced_buttons3 => "",
                  :theme_advanced_toolbar_location => "top",
                  :theme_advanced_toolbar_align => "center",
                  :extended_valid_elements => TINYMCE_CONFIG['extended_valid_elements']
                },
                :only => [:new, :create, :edit, :update]
  
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
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to pages_url
  end
end
