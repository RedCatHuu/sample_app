class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #データをデータベースに保存するためのsaveメソッド実行
    list.save
    #詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    puts "作成したキー #{ENV['SECRET_KEY']}"
    # Listテーブルのすべてを@lisstに代入。
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    #Listテーブルから探し出してきたidのデータをlistに代入
    list = List.find(params[:id])
    #上で代入したデータにアップデートメソッドを実行
    list.update(list_params)
    redirect_to list_path(list.id)
    
    #https://pikawaka.com/rails/update
    #updateについての
  end 
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      #フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end 
  end 
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end 
  
  private
  
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end 
end
