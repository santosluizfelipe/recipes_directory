require 'recipe'
require 'recipe_directory'

RSpec.describe 'RecipeDirectory' do

  def reset_recipes_table
    user = 'postgres'
    password = ENV['050498'].to_s
    seed_sql = File.read('spec/seeds_recipes_directory_test.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test', user: user, password: password  })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_recipes_table
  end

  it 'tests the find method' do 
    repo = RecipeDirectory.new
    recipe = repo.all
    expect(recipe.first.name).to eq 'carbonara'
  end

  it 'should test find method' do 
    repo = RecipeDirectory.new
    recipe = repo.find(1)
    expect(recipe.name).to eq 'carbonara'
    expect(recipe.cooking_time).to eq "8"
    expect(recipe.rating).to eq "5"
  end
end