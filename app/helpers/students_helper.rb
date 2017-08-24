module StudentsHelper
  def fetch_categories
    students =  $redis.get("students")
    if students.nil?
      students = Student.all.to_json
      $redis.set("Degree", students)
    end
    @students = JSON.load students
  end
end
