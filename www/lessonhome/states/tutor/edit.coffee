@struct = module 'edit_profile' :
    name : '  Артемий Дудко'
    text : 'ред'
    top_menu : module 'menu/top_menu' :
      items : {
        'Описание' : '#'
        'Предметы и условия' : '#'
        'Отзывы' : 'reviews'
      }
      active_item : 'Описание'


