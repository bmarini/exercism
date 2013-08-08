defmodule Words do
  import String, only: [ downcase: 1, split: 2 ]
  import Regex, only: [ replace: 3 ]

  def count(sentence) do
    sentence
    |> downcase
    |> remove_punctuation
    |> to_word_list
    |> _count( HashDict.new )
  end

  def remove_punctuation(sentence) do
    replace( %r/[^a-z0-9A-Z ]/, sentence, "" )
  end

  def to_word_list(sentence) do
    split( sentence, %r/\s+/ )
  end

  defp _count( [ word | rest ], hash ) do
    _count( rest, HashDict.update( hash, word, 1, fn(c) -> c + 1 end ) )
  end

  defp _count( [], hash ) do
    hash
  end
end