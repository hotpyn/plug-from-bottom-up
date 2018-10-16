defmodule Helloplug do

  def init(default_opts) do
    IO.puts "starting up Helloplug..."
    default_opts
  end

def call(conn, _opts) do
	IO.puts "here again"
  route(conn.method, conn.path_info, conn)
end

def route("GET", ["hello"], conn) do
  # this route is for /hello
  conn |> Plug.Conn.send_resp(200, "Hello, world!")
end

def route("GET", ["users", user_id], conn) do
  # this route is for /users/<user_id>
  conn |> Plug.Conn.send_resp(200, "You requested user #{user_id}")
end

def route("POST", _path, conn) do
  {:ok ,body,_} = Plug.Conn.read_body(conn)
  body=body |> Plug.Conn.Query.decode
  IO.inspect body
  value=body["data"]
{:ok, file} = File.open "save", [:append]
IO.puts file, value
File.close file
  conn |> Plug.Conn.send_resp(200, "POST #{value}")
end

def route("GET", _path, conn) do
  conn=Plug.Conn.fetch_query_params(conn)
  value=conn.query_params["data"]
  #IO.inspect conn.query_params["data"]
  conn |> Plug.Conn.send_resp(200, "GET #{value}")
end

def route(_method, _path, conn) do
  # this route is called if no other routes match
  conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
end

end
