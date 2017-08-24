class UploadWorker
  include Sidekiq::Worker

  def perform(id)
    @import = Import.find_by_id(id)
    if @import.present?
      Student.upload_csv(@import.file)
    end  
  end
end