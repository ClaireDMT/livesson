json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :lesson_name, :start, :end, :lesson_duration
  json.title lesson.lesson_name
  json.niveau lesson.lesson_level
  json.duration lesson.lesson_duration
end
