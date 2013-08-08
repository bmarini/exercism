defmodule Statement do
  def nothing?(nil), do: true
  def nothing?(statement) do
    String.strip(statement) == ""
  end

  def yelling?(statement) do
    String.upcase(statement) == statement
  end

  def question?(statement) do
    String.ends_with?(statement, "?")
  end
end

defmodule Teenager do
  import Statement

  def hey(statement) do
    cond do
      nothing?(statement)  -> "Fine. Be that way!"
      yelling?(statement)  -> "Woah, chill out!"
      question?(statement) -> "Sure."
      true -> "Whatever."
    end
  end
end