defmodule E.Simpleplug do

  def init(init_opts) do
    IO.puts "in init function"
    init_opts
  end

 def call(conn, _opts) do
    IO.puts "here I am"
    Plug.Conn.send_file(conn, 200, "index.html")
  end

end
