class HomeController < ApplicationController
  require 'date'
  require 'time'
 
  def index
    @package = "Australias Premier Entertainment Agency"
    @categories= Category.where("ancestry is null")
    @artist_profiles = ArtistProfile.where(approved: true).all.limit(6)
    @sub_categories = Category.where("ancestry != ?", "")
    @popular_categories1 = Category.where("ancestry != ?", "").order("RANDOM()").limit(6)
    @popular_categories = Category.where("ancestry != ?", "").order("RANDOM()")
    @popular_category = []
    @popular_categories.each do |category|
      @popular_category << category
    end
    @featured_artist = ArtistProfile.where(approved: true).order("RANDOM()").limit(8)
  end

  def search
    if params[:search].present? and params[:location2].present?
       @artist_profiles = ArtistProfile.approved.search_by_artist_title_keyword_body(params[:search],params[:sub_category_id], params[:location2])

    elsif params[:search].present? and params[:country].present?
      abort
      @artist_profiles = ArtistProfile.approved.search_by_artist_title_keyword_body(params[:search], params[:sub_category_id], params[:location2]).where("country NOT IN (?) and location2 NOT IN (?)", "AU", Category::CITYES)

    elsif params[:search].present? 
      @artist_profiles = ArtistProfile.approved.search_by_artist_title_keyword_body(params[:search], params[:sub_category_id], params[:location2])

    elsif params[:location].present?
       @artist_profiles = ArtistProfile.where("location2 =? and sub_category_id =? and approved =? ", params[:location], params[:id], true)
    elsif params[:country].present?

      where = ""
      where += "keywords = '#{params[:keywords]}'" if !params[:keywords].blank?
      cond = (!where.blank?) ? " AND " : ""
      where += " #{cond} category_id = '#{params[:category_id]}'" if !params[:category_id].blank?
      cond = (!where.blank?) ? " AND " : ""
      where += " #{cond} sub_category_id = '#{params[:sub_category_id]}' " if !params[:sub_category_id].blank?
      cond = (!where.blank?) ? " AND " : ""
      where += " #{cond} price = '#{params[:price]}'" if !params[:price].blank?
      cond = (!where.blank?) ? " AND " : ""
      if where.present?
        @artist_profiles = ArtistProfile.approved.where("country NOT IN (?) or location2 NOT IN (?)", "AU", Category::CITYES).where(where)
      elsif params[:date].present?
        @artist_profiles = ArtistProfile.approved.where(where).joins(:availables).uniq.search(params[:date]).where("country NOT IN (?) or location2 NOT IN (?)", "AU", Category::CITYES)
      else
        @artist_profiles = ArtistProfile.approved.where("country NOT IN (?) and location2 NOT IN (?)", "AU", Category::CITYES)
      end
    else 
      @categories_header = Category.where("ancestry is null")
      where = ""
        where += " #{cond} category_id = '#{params[:category_id]}'" if !params[:category_id].blank?
        cond = (!where.blank?) ? " AND " : ""
        where += " #{cond} sub_category_id = '#{params[:sub_category_id]}' " if !params[:sub_category_id].blank?
        cond = (!where.blank?) ? " AND " : ""
        where += " #{cond} location2 = '#{params[:location2]}'" if !params[:location2].blank?
        cond = (!where.blank?) ? " AND " : ""
        where += " #{cond} price = '#{params[:price]}'" if !params[:price].blank?
        cond = (!where.blank?) ? " AND " : ""
        where += " #{cond} category_id = '#{params[:category]}'" if !params[:category].blank?
        if where.present?
          if params[:date].present?
            @artist_profiles = ArtistProfile.approved.where(where).joins(:availables).uniq.search(params[:date])
          elsif params[:keywords].present?
            @artist_profiles = ArtistProfile.approved.where(where).search_by_artist_title_and_keyword_and_body(params[:keywords])
          else
            @artist_profiles = ArtistProfile.approved.where(where)
          end
        elsif params[:date].present?
          @artist_profiles = ArtistProfile.approved.joins(:contact).joins(:availables).uniq.search(params[:date])
        elsif params[:keywords].present?
          @artist_profiles = ArtistProfile.approved.search_by_artist_title_and_keyword_and_body(params[:keywords])
        else 
          @artist_profiles = ArtistProfile.approved
        end
      end
  end


  def sub_categories
  @sub_categories = Category.where("ancestry = ?", params[:id])
    @sub_categories = @sub_categories.select('id, name').map do |cat|
      [cat.name, cat.id]
    end
  end

end