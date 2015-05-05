# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
list = List.create(title: 'My First List')
list.tasks << Task.create(
                          title: 'first task title',
                          description: 'first task description',
                          due_date: '05/10/2015'
                         )
list.tasks << Task.create(
                          title: 'second task title',
                          description: 'second task description',
                          due_date: '05/10/2015'
                         )
