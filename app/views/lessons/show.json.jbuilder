json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :lesson_name
  # json.start lesson.beginning_time
  # json.end lesson.end_time
  # json.title lesson.lesson_name
  # json.url lesson_url(lesson, format: :html)
end
