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
    new_time = to_dot(@start_time)
    end_time = '%.2f' % (new_time + @hours_in_school_day)
    to_colon(end_time)
  end

  def is_full_time?
    @hours_in_school_day >= 7
  end

  def standard_student_names
    student_names.map do |student|
      student.capitalize
    end
  end

  def convert_end_time_to_clock_time
    new_time = to_dot(end_time)
    clock_time = '%.2f' % (new_time-12.abs)
    to_colon(clock_time)
  end

  def to_dot(time_string)
    time_string.gsub(":", ".").to_f
  end

  def to_colon(time_float)
    time_float.to_s.gsub(".", ":")
  end

end
