defmodule SimpleplugTest do
  use ExUnit.Case
  doctest Simpleplug

  test "greets the world" do
    assert Simpleplug.hello() == :world
  end
end
