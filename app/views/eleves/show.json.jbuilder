json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :lesson_name, :start, :end
  json.title lesson.lesson_name
  json.niveau lesson.lesson_level
  json.url lesson_url(lesson, format: :html)
end
