defmodule Helloplug do

 use Plug.Router

  plug Plug.Static, at: "/", from: :server

  plug :match
  plug :dispatch

  get "/" do
    conn = put_resp_content_type(conn, "text/html")
    send_file(conn, 200, "priv/static/index.html")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end

end
