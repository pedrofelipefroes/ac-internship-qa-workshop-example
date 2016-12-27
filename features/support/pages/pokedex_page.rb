# Maps the Pokédex page from Pokémon.com

class PokedexPage
	include PageObject

	page_url ExecutionEnvironment.url

	text_field :search_input, id: 'searchInput'
	button :search_button, id: 'search'
	h5 :pokemon_card_name, xpath: '/html/body/div[3]/section[6]/ul/li/div[2]/h5'
	# a :pokemon_card, class: 'body > div.container.pokedex > section.section.pokedex-results.overflow-visible'

	def initialize_page
		search_input_element.when_present(5)
	end

	def fill_search_input(pokemon)
		self.search_input = pokemon
	end

	def search_pokemon
		search_button
	end

	def verify_pokemon_card
		wait_until { pokemon_card_name_element.visible? }
		return pokemon_card_name
	end
end