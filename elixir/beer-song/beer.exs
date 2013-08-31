defmodule Beer do
  import String, only: [ capitalize: 1 ]

  def sing(start),         do: sing(start, 0)
  def sing(start, start),  do: verse(start) <> "\n"
  def sing(start, finish), do: verse(start) <> "\n" <> sing(start - 1, finish)

  @doc """
  Return a verse of our favorite beer song

  Example

      iex> Beer.verse(99)
      "99 bottles of beer on the wall, 99 bottles of beer.\nTake one down and pass it around, 98 bottles of beer on the wall.\n"

      iex> Beer.verse(1)
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"

      iex> Beer.verse(0)
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  """
  def verse(n) do
    """
    #{ bottle(n) |> capitalize } of beer on the wall, #{ bottle(n) } of beer.
    #{ action(n) }, #{ bottle(n - 1) } of beer on the wall.
    """
  end

  defp bottle(0), do: "no more bottles"
  defp bottle(1), do: "1 bottle"
  defp bottle(n) when n < 0, do: bottle(99)
  defp bottle(n), do: "#{n} bottles"

  defp action(0), do: "Go to the store and buy some more"
  defp action(1), do: "Take it down and pass it around"
  defp action(_), do: "Take one down and pass it around"
end