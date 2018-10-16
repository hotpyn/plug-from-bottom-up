defmodule Example.Myplug do

  def init(default_opts) do
    IO.puts "starting up Myplug..."
    default_opts
  end

  def call(conn, _opts) do
	IO.puts "here again"

	IO.inspect conn, pretty: true

	case conn.method do
	  "GET" ->
  		conn=Plug.Conn.fetch_query_params(conn)
  		value=conn.query_params["data"]
  		IO.inspect conn.query_params["data"]
  		conn |> Plug.Conn.send_resp(200, "GET #{value}")
	  "POST" ->
  		{:ok ,body,_} = Plug.Conn.read_body(conn)
  		body=body |> Plug.Conn.Query.decode
  		IO.inspect body
  		value=body["data"]
		{:ok, file} = File.open "save", [:append]
		IO.puts file, value
		File.close file
  		conn |> Plug.Conn.send_resp(200, "POST #{value}")
	  _ ->
  		conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")

	end
  end
end

