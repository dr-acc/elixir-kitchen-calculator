defmodule KitchenCalculator do
  @chart %{
    :milliliter => 1,
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15
  }
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({unit, volume}), do: {:milliliter, volume * @chart[unit]}

  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / @chart[unit]}

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
