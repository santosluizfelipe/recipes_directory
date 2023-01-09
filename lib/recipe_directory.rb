require 'pg'
require_relative './recipe'

class RecipeDirectory

  def initialize 
    @conn = PG.connect(
      host: '127.0.0.1',
      user: 'postgres',
      password: '050498',
      dbname: 'recipes_directory_test'
    )
  end

  def all 
    recipes = []

    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    result_set = @conn.exec(sql)

    result_set.each do |record|
      recipe = Recipe.new

      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end
    recipes
  end

  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1'
    sql_params = [id]
    result_set = @conn.exec(sql, sql_params)
    record = result_set[0]
    recipe = Recipe.new 
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']
    p recipe
  end
end