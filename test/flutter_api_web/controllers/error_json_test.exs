defmodule FlutterApiWeb.ErrorJSONTest do
  use FlutterApiWeb.ConnCase, async: true

  test "renders 404" do
    assert FlutterApiWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert FlutterApiWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
