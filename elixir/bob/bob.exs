defmodule Teenager do
  defmodule Statement do
    def nothing?(statement) do
      statement == nil || String.strip(statement) == ""
    end

    def yelling?(statement) do
      String.upcase(statement) == statement
    end

    def question?(statement) do
      String.last(statement) == "?"
    end
  end

  def hey(statement) do
    cond do
      Statement.nothing?(statement) -> "Fine. Be that way!"
      Statement.yelling?(statement) -> "Woah, chill out!"
      Statement.question?(statement) -> "Sure."
      true -> "Whatever."
    end
  end
end