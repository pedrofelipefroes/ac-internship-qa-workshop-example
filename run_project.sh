if [ $# -ne 2 ]; then
	echo -e 'Invalid number of arguments on ' $0 '.\nPlease run following the pattern: <feature_file_name> <browser_name>'
	exit
fi

bundle exec cucumber $1 URL=http://www.pokemon.com/us/pokedex/ BROWSER=$2