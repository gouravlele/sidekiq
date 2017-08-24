class StudentsController < ApplicationController
  def index
    
  end
  def create
    
  end
  def import

  end
  def upload
    @import_file = Import.create(file: params[:file])
    UploadWorker.perform_async(@import_file.id)
  end
end
