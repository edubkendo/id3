defmodule ID3 do
  def start(file_name) do
    %{title: title, artist: artist, album: album, year: year} = parse(file_name)
    enc = 'euc-jp'
    IO.puts "#{convert(artist, enc)} - #{convert(title, enc)} (#{convert(album, enc)}, #{convert(year, enc)})"
  end

  def convert(str, encoding) do
    {:ok, encoded} = get_converter(encoding)
    |> :iconv.conv(str)
    encoded
  end

  def get_converter(encoding) do
    {:ok, converter} = :iconv.open('utf-8', encoding)
    converter
  end

  def parse(file_name), do: ID3.Parser.parse(file_name)
end
