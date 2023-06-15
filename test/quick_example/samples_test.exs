defmodule QuickExample.SamplesTest do
  use QuickExample.DataCase

  alias QuickExample.Samples

  describe "notes" do
    alias QuickExample.Samples.Note

    import QuickExample.SamplesFixtures

    @invalid_attrs %{content: nil}

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Samples.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Samples.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %Note{} = note} = Samples.create_note(valid_attrs)
      assert note.content == "some content"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Samples.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Note{} = note} = Samples.update_note(note, update_attrs)
      assert note.content == "some updated content"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Samples.update_note(note, @invalid_attrs)
      assert note == Samples.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Samples.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Samples.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Samples.change_note(note)
    end
  end
end
