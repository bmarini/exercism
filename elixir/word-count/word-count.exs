defmodule Words do
  import String, only: [ downcase: 1, split: 2 ]
  import Regex, only: [ replace: 3 ]

  def count(phrase) do
    phrase
    |> downcase
    |> remove_punctuation
    |> to_word_list
    |> _count( HashDict.new )
  end

  defp remove_punctuation(phrase) do
    replace( %r/[^a-z0-9\s]/, phrase, "" )
  end

  defp to_word_list(phrase) do
    split( phrase, %r/\s+/ )
  end

  defp _count( [ word | rest ], hash ) do
    _count( rest, HashDict.update( hash, word, 1, fn(c) -> c + 1 end ) )
  end

  defp _count( [], hash ) do
    hash
  end
end