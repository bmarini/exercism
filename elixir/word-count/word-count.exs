defmodule Words do
  import String, only: [ downcase: 1 ]
  import Regex, only: [ scan: 2 ]

  def count(phrase) do
    phrase
    |> downcase
    |> to_word_list
    |> _count( HashDict.new )
  end

  defp to_word_list(phrase) do
    scan( %r/\w+/, phrase )
  end

  defp _count( [ word | rest ], hash ) do
    _count( rest, HashDict.update( hash, word, 1, &1 + 1 ) )
  end

  defp _count( [], hash ) do
    hash
  end
end