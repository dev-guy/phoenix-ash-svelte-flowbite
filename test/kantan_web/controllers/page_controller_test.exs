defmodule KantanWeb.PageControllerTest do
  use KantanWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/healthcheck")
    assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  end
end
