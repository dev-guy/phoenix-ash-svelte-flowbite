defmodule KantanWeb.PageControllerTest do
  use KantanWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/healthcheck")
    assert html_response(conn, 200) =~ "Loaded"
  end
end
