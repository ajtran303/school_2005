class School
  attr_reader :start_time,
              :hours_in_school_day,
              :student_names

  def initialize(time, hrs)
    @start_time = time
    @hours_in_school_day = hrs
    @student_names = []
  end

  def add_student_name(student)
    @student_names << student
  end

  def end_time
    start = @start_time.gsub(":", ".").to_f
    hours = @hours_in_school_day * 1.00
    finish = start + hours
    "#{finish}0".gsub(".", ":")
  end

  def is_full_time?
    true
  end

  def standard_student_names
    student_names.map do |student|
      student.capitalize
    end
  end

  def convert_end_time_to_clock_time
    time = end_time.gsub(":", ".").to_f
    clock = time-12.abs
    "#{clock}0".gsub(".", ":")
  end

end
