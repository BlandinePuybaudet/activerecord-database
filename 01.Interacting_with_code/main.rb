require 'sqlite3'

# opens the database
database_path = "db/jukebox.sqlite"
db = SQLite3::Database.new(database_path)

def number_of_rows(db,table_name)
	db.execute("SELECT COUNT(*) FROM #{table_name}")
end

puts "There are #{number_of_rows(db,"Artist")} artists"
puts "There are #{number_of_rows(db,"Track")} tracks"
puts "There are #{number_of_rows(db,"Album")} albums"
puts "There are #{number_of_rows(db,"Genre")} genres"
puts "There are #{number_of_rows(db,"MediaType")} media types"


# returns all the artists sorted by alphabetical order.
#artists = db.execute("SELECT Name FROM Artist ORDER BY Name ASC")
#p artists

# returns all the love songs
love_songs = db.execute("SELECT COUNT(*) Name FROM Track WHERE Name LIKE '%love%'")
p love_songs

long_tracks = db.execute("SELECT Name FROM Track WHERE Milliseconds >1000*60*10 ORDER BY Milliseconds")
p long_tracks
