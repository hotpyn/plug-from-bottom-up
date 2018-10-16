defmodule MyplugTest do
  use ExUnit.Case
  doctest Myplug

  test "greets the world" do
    assert Myplug.hello() == :world
  end
end
