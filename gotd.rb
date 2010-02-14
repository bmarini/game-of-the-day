# Scraping the game of the day from chessgames.com
# This is what we are looking for:
#
# <!--begingameotd--><a href="/perl/chessgame?gid=1176374">Kameswaran Visweswaran<br>
# <font size=-2>vs</font><br>
# Christopher Ward</a><br><font size=-2>A Ward Winning Game</font><!--endgameotd-->

class GameOfTheDay
  @@pgn_cache = {}

  def pgn
    @@pgn_cache[Time.now.strftime("%Y-%m-%d")] ||= get(pgn_uri)
  end
  
  def pgn_uri
    "http://www.chessgames.com/perl/nph-chesspgn?text=1&gid=#{gid}"
  end
  
  def gid
    get('http://www.chessgames.com/').
    match(/begingameotd--><a href="\/perl\/chessgame\?gid=(\d+)">/)[1]
  end

  def get(uri)
    Net::HTTP.get_response( URI.parse(uri) ).body
  end
end

get '/' do
  erb :index
end

get '/gotd' do
  gotd = GameOfTheDay.new
  gotd.pgn
end

