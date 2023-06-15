defmodule QuickExample.SamplesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuickExample.Samples` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> QuickExample.Samples.create_note()

    note
  end
end
