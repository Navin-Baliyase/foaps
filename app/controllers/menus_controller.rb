class MenusController < ApplicationController
  def index
    @categories = Category.includes(:menu_items).references(:menu_items)
  end

  def import
    uploaded_file = params[:file]
    permanent_path = Rails.root.join('tmp', uploaded_file.original_filename)
    File.open(permanent_path, 'wb') do |file|
      file.write(uploaded_file.read)
    end
    CsvImportJob.perform_async(permanent_path.to_s)
    redirect_to root_path, notice: 'Menu upload job in progress, please wait...'
  end
end
