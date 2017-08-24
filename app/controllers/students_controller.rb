class StudentsController < ApplicationController
  require 'my_file_util'
  def index
    
  end
  def create
    
  end
  def import

  end
  def upload
    if current_user.has_role? :admin
      @import_file = Import.create(file: params[:file])
      UploadWorker.perform_async(@import_file.id)
    else
      spreadsheet = MyFileUtil.open_file(params[:file])
      if spreadsheet.last_row > 1000
        flash[:alert] = "Not Authorized!!!"
        render :action => :import
      else
        @import_file = Import.create(file: params[:file])
        UploadWorker.perform_async(@import_file.id)
      end  
    end    
  end
end
