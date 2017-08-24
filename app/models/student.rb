class Student < ApplicationRecord
  require 'my_file_util'
  def self.upload_csv file
   spreadsheet = MyFileUtil.open_file(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
        params = { name: row["name".strip()], 
                   address: row["address".strip()],
                   father_name: row["father_name".strip()],
                   degree: row["degree".strip()]
                  }
        student = Student.find_or_create_by( name: params[:name], address: params[:address])
        student.update_attributes(params)
    end
  end
end
