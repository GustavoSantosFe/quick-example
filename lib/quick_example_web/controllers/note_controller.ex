defmodule QuickExampleWeb.NoteController do
  use QuickExampleWeb, :controller

  alias QuickExample.Samples
  alias QuickExample.Samples.Note

  def index(conn, _params) do
    notes = Samples.list_notes()
    render(conn, :index, notes: notes)
  end

  def new(conn, _params) do
    changeset = Samples.change_note(%Note{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"note" => note_params}) do
    case Samples.create_note(note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: ~p"/notes/#{note}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    note = Samples.get_note!(id)
    render(conn, :show, note: note)
  end

  def edit(conn, %{"id" => id}) do
    note = Samples.get_note!(id)
    changeset = Samples.change_note(note)
    render(conn, :edit, note: note, changeset: changeset)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = Samples.get_note!(id)

    case Samples.update_note(note, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note updated successfully.")
        |> redirect(to: ~p"/notes/#{note}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, note: note, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = Samples.get_note!(id)
    {:ok, _note} = Samples.delete_note(note)

    conn
    |> put_flash(:info, "Note deleted successfully.")
    |> redirect(to: ~p"/notes")
  end
end
