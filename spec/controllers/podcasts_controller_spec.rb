require 'rails_helper'

RSpec.describe PodcastsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_podcast) { my_topic.podcasts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_podcast.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_podcast.id
      expect(response).to render_template :show
    end

    it "assigns my_podcast to @podcast" do
      get :show, topic_id: my_topic.id, id: my_podcast.id
      expect(assigns(:podcast)).to eq(my_podcast)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @podcast" do
      get :new, topic_id: my_topic.id
      expect(assigns(:podcast)).not_to be_nil
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_podcast.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_podcast.id
      expect(response).to render_template :edit
    end

    it "assigns podcast to be updated to @podcast" do
      get :edit, topic_id: my_topic.id, id: my_podcast.id

      podcast_instance = assigns(:podcast)

      expect(podcast_instance.id).to eq my_podcast.id
      expect(podcast_instance.title).to eq my_podcast.title
      expect(podcast_instance.body).to eq my_podcast.body
      expect(podcast_instance.price).to eq my_podcast.price
    end
  end
end
