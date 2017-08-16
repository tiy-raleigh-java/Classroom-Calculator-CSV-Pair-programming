require 'csv'

def print_gradebook(filename)
  gradebook = CSV.read(filename)
  assignment_names = gradebook[0].drop(1)
  grade_hash = {}
  gradebook.drop(1).each do |row|
    student = row[0]
    grades = row.drop(1).map { |grade| Integer(grade) }
    grade_hash[student] = grades
  end

  students_in_order = top_students(grade_hash)
  puts "Average by student:"
  students_in_order.each do |student|
    average = student_average(grade_hash, student)
    puts "  #{student}: #{average} (#{letter_grade(average)})"
  end
  puts

  puts "Average by assignment:"
  assignment_names.each_with_index do |name, idx|
    average = assignment_average_score(grade_hash, idx)
    puts "  #{name}: #{average} (#{letter_grade(average)})"
  end
  puts

  puts "Class average: #{class_average(grade_hash)}"
end

def list_average(list)
  list.sum / list.length
end

def averages(grade_hash)
  grade_hash.transform_values do |scores|
    list_average(scores)
  end
end

def assignment_scores(grade_hash, assignment_num)
  grade_hash.values.map { |scores| scores[assignment_num] }
end

def assignment_average_score(grade_hash, assignment_num)
  scores = assignment_scores(grade_hash, assignment_num)
  list_average(scores)
end

def student_average(grade_hash, student)
  scores = grade_hash[student]
  list_average(scores)
end

def letter_grade(score)
  if score >= 90
    "A"
  elsif score >= 80
    "B"
  elsif score >= 70
    "C"
  elsif score >= 60
    "D"
  else
    "F"
  end
end

def class_average(grade_hash)
  scores = averages(grade_hash).values
  list_average(scores)
end

def top_students(grade_hash)
  averages(grade_hash)
    .to_a
    .sort_by { |student| -student[1] }
    .map { |student| student[0] }
end

if __FILE__ == $0
  filename = $ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      print_gradebook(full_filename)
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
