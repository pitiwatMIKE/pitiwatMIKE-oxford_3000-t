class OxfordWordsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: [:remember, :marked, :cancle_remember, :cancle_marked]
  
    def index
      @oxford_words = OxfordWord.ransack(word_start: params[:char]).result
    end
  
    def remember
      word_id = params[:id].split("-")[1]
      if OxfordWord.find(word_id).remember_words.blank?
        remember_word = RememberWord.new(oxford_word_id: word_id, can_remember: true, user_id: 1)
      else
        remember_word = RememberWord.find_by(oxford_word_id: word_id)
        remember_word.can_remember = true
      end
  
      if remember_word.save
        render json: { status: true, message: "success" }
      else
        render json: { status: false, message: "failed" }
      end
    end
  
    def marked
      word_id = params[:id].split("-")[1]
      if OxfordWord.find(word_id).remember_words.blank?
        remember_word = RememberWord.new(oxford_word_id: word_id, marked: true, user_id: 1)
      else
        remember_word = RememberWord.find_by(oxford_word_id: word_id)
        remember_word.marked = true
      end
  
      if remember_word.save
        render json: { status: true, message: "success" }
      else
        render json: { status: false, message: "failed" }
      end
    end
  
    def cancle_remember
      word_id = params[:id].split("-")[1]
      remember_word = RememberWord.find_by(oxford_word_id: word_id)
      remember_word.can_remember = false
  
      if remember_word.save
        render json: { status: true, message: "success" }
      else
        render json: { status: false, message: "failed" }
      end
    end
  
    def cancle_marked
      word_id = params[:id].split("-")[1]
      remember_word = RememberWord.find_by(oxford_word_id: word_id)
      remember_word.marked = false
  
      if remember_word.save
        render json: { status: true, message: "success" }
      else
        render json: { status: false, message: "failed" }
      end
    end
  end
  