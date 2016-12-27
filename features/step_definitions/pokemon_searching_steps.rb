Given(/^the user is on the Pokédex page$/) do
	visit(PokedexPage)
	on(PokedexPage).initialize_page
end

When(/^the user searches for a valid Pokémon name$/) do
	pokemon = YAML.load_file('config/data/pokemon.yml')['pokemon']['name']
	on(PokedexPage).fill_search_input(pokemon)
	on(PokedexPage).search_pokemon
end

Then(/^it should display the corresponding Pokémon card$/) do
	pokemon = YAML.load_file('config/data/pokemon.yml')['pokemon']['name']
	expect(on(PokedexPage).verify_pokemon_card).to eq(pokemon)
end