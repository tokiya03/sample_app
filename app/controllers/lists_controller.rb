class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # 1.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 3. 対象のカラムにデータが入力されていたら、データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    # 4-1. 詳細画面へリダイレクト
      redirect_to list_path(@list.id)
    else
    # 4-2. 対象のカラムのデータが入力されていなければ、新規投稿ページを再表示
      render :new
      # 以下はnewアクションを経由してnew.html.erbに渡す処理となるため間違い！ (= 入力データが空になる)
      # redirect_to new_list_path
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
