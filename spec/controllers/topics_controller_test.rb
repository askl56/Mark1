require 'rails_helper'

describe TopicsController do
  render_views

  describe 'GET #index' do
    it 'lists topics' do
      hello = create(:topic, title: 'Hello')
      get :index, letter: 'S'
      expect(assigns(:topics)).to match_array([hello])
    end

    it 'renders #index' do
      get :index, letter: 'S'
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'assigns a new topic to @topic' do
      get :new
      expect(assigns(:topic)).to be_a_new(Topic)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested topic to @topic' do
      topic = create(:topic)
      get :edit, id: topic
      expect(assigns(:topic)).to eq topic
    end

    it 'renders #edit' do
      topic = create(:topic)
      get :edit, :format => "html", id: topic
      expect(response).to render_template :edit
    end
  end
end
