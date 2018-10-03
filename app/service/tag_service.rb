class TagService

  def initialize(params)
   @tag = params[:tag]
   @question = params[:users_question]
  end

  def add_tag
    @tags = @tag.split(" ")
    @tags.each do |tag|
      if check_if_tag_exists?(tag)
        add_question_to_existing_tag tag
      else
        create_new_tag tag
      end
    end
  end


  def add_question_to_existing_tag(tag)
    t = Tag.find_by(tag_name:tag)
    t.questions << @question
  end


  def create_new_tag(tag)
    t= Tag.new(tag_name:tag)
    t.save!
    t.questions << @question
  end


  def check_if_tag_exists?(tag)
    Tag.where(tag_name:tag).present?
  end

end