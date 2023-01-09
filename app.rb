require_relative 'lib/database_connection'
require_relative 'lib/recipe_directory'

DatabaseConnection.connect('recipes_directory_test')

result = DatabaseConnection.exec_params('SELECT * FROM recipes;', [])

result.each do |record|
  p record
end

