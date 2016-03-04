ACTIVITY = ['calisthenics', 'bike', 'hike', 'yoga', 'rest']
LOCATION = ['Vista Hermosa Natural Park', 'Mountain Lion Loop',
            'Carosel Loop', 'Atwater Village', 'Stay Home']
DESCRIPTION = ['Do the snake.', 'Take on trash truck hill.',
               'Get to the bridge.', 'Hot and sweaty',
               'Let your muscles rebuild.']

5.times do |i|
  Workout.create(
      date_time: Date.today.strftime("%A, %B %d %I:%M %P"),
      activity: ACTIVITY[i],
      location: LOCATION[i],
      description: DESCRIPTION[i]
      )
end
