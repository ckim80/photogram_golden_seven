class PhotosController < ApplicationController

  def index
    @list_of_all_my_photos = Photo.all

    render("photos/index.html.erb")
  end

  def create_row
    url = params[:The_source]
    cap = params[:The_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    # render("photos/create_row.html.erb")
    redirect_to("/photos")
    #{new_photo.id}"
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def show
    the_id = params[:id]
    @my_photo = Photo.find(the_id)
    render("photos/show.html.erb")
  end

  def edit_form
    the_id = params[:id]
    @my_photo = Photo.find(the_id)
    render("photos/edit_form.html.erb")
  end

  def update_row
    url_edit = params[:source]
    cap_edit = params[:caption]

    photo_edit = Photo.find(params[:id])
    photo_edit.source = url_edit
    photo_edit.caption = cap_edit
    photo_edit.save
    redirect_to("/photos/:id")
    # render("photos/update_row.html.erb")
  end

  def destroy_row
    photo = Photo.find(params[:id])
    photo.destroy
    # render("photos/destroy_row.html.erb")
    redirect_to("/photos")
  end

end
