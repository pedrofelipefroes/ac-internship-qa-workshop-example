Feature: Pokémon searching

Scenario: Search from main page
	Given the user is on the Pokédex page
	When the user searches for a valid Pokémon name
	Then it should display the corresponding Pokémon card