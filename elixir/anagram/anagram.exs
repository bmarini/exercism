defmodule Anagram do
  import String, only: [ downcase: 1, codepoints: 1]
  import Enum, only: [ filter: 2, sort: 1]

  def match( word, words) do
    filter words, anagram?(&1, word)
  end

  def anagram?(a, a), do: false
  def anagram?(a, b) do
    sorted_codepoints(a) == sorted_codepoints(b)
  end

  defp sorted_codepoints(string) do
    string |> downcase |> codepoints |> sort
  end
  
end