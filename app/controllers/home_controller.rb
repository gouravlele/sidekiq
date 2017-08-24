class HomeController < ApplicationController 
  def index
    
  end

  def download_sample_csv
    respond_to do |format|
      format.csv { render text: sample}
    end
  end

  def sample
    CSV.generate do |csv|
      csv << ["name", "address", "father_name", "degree"]
    end  
  end
end
