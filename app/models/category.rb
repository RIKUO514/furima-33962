class Category < ActiveHash::Base
  
  include ActiveHash::Associations
  has_many :items

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ヘビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: '家電・スマホ・カメラ' },
    { id: 8, name: 'スポーツ・レジャー' },
    { id: 9, name: 'ハンドメイド' },
    { id: 10, name: 'その他' }
  ]
  end