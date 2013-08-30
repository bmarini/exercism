defmodule Anagram do
  import String, only: [ downcase: 1, codepoints: 1 ]
  import Enum, only: [ filter: 2, sort: 1 ]

  def match(subject, candidates) do
    filter candidates, anagram?(subject, &1)
  end

  def anagram?(_subject, _subject), do: false
  def anagram?(subject, candidate) do
    sorted_codepoints(subject) == sorted_codepoints(candidate)
  end

  defp sorted_codepoints(string) do
    string |> downcase |> codepoints |> sort
  end
end