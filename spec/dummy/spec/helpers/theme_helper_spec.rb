require 'spec_helper'

module Poodle
  module ActionView
    describe ThemeHelper, type: :helper do

      describe '#theme_fa_icon' do
        it "theme_fa_icon" do
          expect(helper.theme_fa_icon("some-class")).to eq("<i class='fa fa-some-class'></i>")
          expect(helper.theme_fa_icon("some-class", "lg")).to eq("<i class='fa fa-some-class fa-lg'></i>")
          expect(helper.theme_fa_icon("some-class", "2x")).to eq("<i class='fa fa-some-class fa-2x'></i>")
          expect(helper.theme_fa_icon("some-class", "invalid")).to eq("<i class='fa fa-some-class'></i>")
        end
      end

      describe '#theme_button_text' do
        it "theme_button_text" do
          expect(helper.theme_button_text("Some Text")).to eq("<span class='btn-text'> Some Text</span>")
        end
      end

      describe '#theme_button' do
        it "theme_button" do
          expect(helper.theme_button("Create User", 'user-icon', '/some/url')).to eq("<a class=\"btn btn-primary btn-md pull-right ml-5 mb-5\" data-remote=\"true\" data-method=\"get\" href=\"/some/url\"><i class='fa fa-user-icon'></i><span class='btn-text'> Create User</span></a>")

          options = { method: :post, remote: false, btn_type: :danger, btn_size: :lg, classes: "cls-abc", data: {} }
          expect(helper.theme_button("Create User", 'user-icon', '/some/url', **options)).to eq("<a class=\"btn btn-danger btn-lg cls-abc\" rel=\"nofollow\" data-method=\"post\" href=\"/some/url\"><i class='fa fa-user-icon'></i><span class='btn-text'> Create User</span></a>")
        end
      end

      describe '#theme_edit_button' do
        it "theme_edit_button" do
          expect(helper.theme_edit_button('/edit/url')).to eq("<a class=\"btn btn-default btn-xs pull-right ml-10\" data-remote=\"true\" data-method=\"get\" href=\"/edit/url\"><i class='fa fa-edit'></i><span class='btn-text'> Edit</span></a>")

          options = { text: "Custom Edit", icon: "edit-icon", method: :post, remote: false, btn_type: :danger, btn_size: :lg, classes: "cls-abc", data: {} }
          expect(helper.theme_edit_button('/edit/url', **options)).to eq("<a class=\"btn btn-danger btn-lg cls-abc\" rel=\"nofollow\" data-method=\"post\" href=\"/edit/url\"><i class='fa fa-edit-icon'></i><span class='btn-text'> Custom Edit</span></a>")
        end
      end

      describe '#theme_delete_button' do
        it "theme_delete_button" do
          expect(helper.theme_delete_button('/delete/url')).to eq("<a class=\"btn btn-danger btn-xs pull-right ml-10\" data-confirm=\"Are you sure?\" data-remote=\"true\" rel=\"nofollow\" data-method=\"delete\" href=\"/delete/url\"><i class='fa fa-trash'></i><span class='btn-text'> Delete</span></a>")

          options = { text: "Custom Delete", icon: "delete-icon", method: :post, remote: false, btn_type: :danger, btn_size: :lg, classes: "cls-abc", data: {confirm: "Sure?"} }
          expect(helper.theme_delete_button('/delete/url', **options)).to eq("<a class=\"btn btn-danger btn-lg cls-abc\" data-confirm=\"Sure?\" rel=\"nofollow\" data-method=\"post\" href=\"/delete/url\"><i class='fa fa-delete-icon'></i><span class='btn-text'> Custom Delete</span></a>")
        end
      end

      describe '#theme_heading' do
        it "theme_heading" do
          expect(helper.theme_heading("Heading Text")).to eq("<div class=\"row mb-10\"><div class=\"fs-22 col-sm-12\"><i class='fa fa-rub fa-lg'></i> Heading Text</div></div>")
          expect(helper.theme_heading("Heading Text2", icon='icon-abcd')).to eq("<div class=\"row mb-10\"><div class=\"fs-22 col-sm-12\"><i class='fa fa-icon-abcd fa-lg'></i> Heading Text2</div></div>")
        end
      end

      describe '#theme_search_form' do
        it "theme_search_form" do
        end
      end

      describe '#theme_drop_down' do
        it "theme_drop_down" do
        end
      end

      describe '#clear_tag' do
        it "clear_tag" do
        end
      end

      describe '#theme_paginate' do
        it "theme_paginate" do
        end
      end

      describe '#theme_panel_message' do
        it "theme_panel_message" do
        end
      end

      describe '#theme_panel_title' do
        it "theme_panel_title" do
        end
      end

      describe '#theme_item_title' do
        it "theme_item_title" do
        end
      end

      describe '#theme_item_sub_title' do
        it "theme_item_sub_title" do
        end
      end

      describe '#theme_item_description' do
        it "theme_item_description" do
        end
      end

      describe '#theme_detail_box' do
        it "theme_detail_box" do
        end
      end

      describe '#theme_more_widget' do
        it "theme_more_widget" do
        end
      end

      describe '#theme_panel_heading' do
        it "theme_panel_heading" do
        end
      end

      describe '#theme_panel_sub_heading' do
        it "theme_panel_sub_heading" do
        end
      end

      describe '#theme_panel_description' do
        it "theme_panel_description" do
        end
      end

      describe '#theme_image' do
        it "theme_image" do
        end
      end

      describe '#palceholdit' do
        it "palceholdit" do
          expect(helper.palceholdit()).to eq("http://placehold.it/60x60&text=<No Image>")
          expect(helper.palceholdit(width: 60, height: 40, text: "Not Found")).to eq("http://placehold.it/60x40&text=Not Found")
        end
      end

      describe '#theme_user_image' do
        let(:user) { FactoryGirl.create(:user) }
        let(:user_with_image) { FactoryGirl.create(:user_with_image, name: "Some Name") }
        it "should display placeholder image for user without image" do
          expect(helper.theme_user_image(user, "profile_picture.image_url(:thumb)")).to eq("<div><div class=\"rounded\" style=\"width:60px;height:60px;\"><img class=\"\" style=\"width:100%;height:auto;cursor:pointer;\" src=\"http://placehold.it/60x60&amp;text=&lt;No Image&gt;\" alt=\"60x60&amp;text=&lt;no image&gt;\" /></div></div>")
        end

        it "should display the profile picture user with image" do
          # data-toggle=\"popover\" data-placement=\"bottom\" title=\"Some Name\" data-content=\"true\"
          expect(helper.theme_user_image(user_with_image, "profile_picture.image_url(:thumb)")).to eq("<div><div class=\"rounded\" style=\"width:60px;height:60px;\"><img class=\"\" style=\"width:100%;height:auto;cursor:pointer;\" src=\"http://localhost:9001/uploads/profile_picture/image/1/thumb_test.jpg\" alt=\"Thumb test\" /></div></div>")
        end

        it "should display the profile picture with popover" do
          expect(helper.theme_user_image(user_with_image, "profile_picture.image_url(:thumb)", popover: true)).to eq("<div><div class=\"rounded\" style=\"width:60px;height:60px;\"><img class=\"\" style=\"width:100%;height:auto;cursor:pointer;\" data-toggle=\"popover\" data-placement=\"bottom\" title=\"Some Name\" data-content=\"\" src=\"http://localhost:9001/uploads/profile_picture/image/1/thumb_test.jpg\" alt=\"Thumb test\" /></div></div>")

          expect(helper.theme_user_image(user_with_image, "profile_picture.image_url(:thumb)", popover:
            "Hello")).to eq("<div><div class=\"rounded\" style=\"width:60px;height:60px;\"><img class=\"\" style=\"width:100%;height:auto;cursor:pointer;\" data-toggle=\"popover\" data-placement=\"bottom\" title=\"Some Name\" data-content=\"Hello\" src=\"http://localhost:9001/uploads/profile_picture/image/1/thumb_test.jpg\" alt=\"Thumb test\" /></div></div>")
        end
      end

    end
  end
end