require_relative '../config/environment'

Person.find_by_name('Tom Cruise')
Person.films(Person.find_by_name('Tom Cruise')['known_for'])

welcome
menu
goodbye
