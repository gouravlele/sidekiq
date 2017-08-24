require 'rubygems'
require 'roo'
require 'csv'
class MyFileUtil
  def self.open_file(file)
    case File.extname(file.original_filename)
      when ".csv" then
        Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then
        Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then
        Roo::Excelx.new(file.path, nil, :ignore)
      else
        raise "Unknown file type: #{file.original_filename}"
    end
  end

end
