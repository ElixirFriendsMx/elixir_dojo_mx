defmodule Person do
  defstruct name: "", age: 0

  @doc """
    Creates a new person.

    Example:
      
      iex> Person.new "Agus", 35
      %Person{age: 35, name: "Agus"}

  """
  def new(name, age) do
    %Person{name: name, age: age}
  end

  @doc """
    Updates the age of a person

    Example:

      iex> Person.new("Agus", 15) |> Person.update(age: 35)
      %Person{age: 35, name: "Agus"}
  """
  def update(person = %Person{}, age: age) do
    %{person | age: age}
  end

  @doc """
    Updates the name of a person

    Example:

      iex> Person.new("Agus", 35) |> Person.update(name: "Agustín Ramos")
      %Person{age: 35, name: "Agustín Ramos"}
  """
  def update(person = %Person{}, name: name) do
    %{person | name: name}
  end

  @doc """
    Returns the name of a person

    Example:

      iex> Person.new("Agus", 35) |> Person.name_of
      "Agus"

  """
  def name_of(person = %Person{}) do
    person.name
  end
end
