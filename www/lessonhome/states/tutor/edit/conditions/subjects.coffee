class @main extends template '../../../tutor'
  route : '/tutor/edit/subjects'
  model   : 'tutor/edit/description/subjects'
  title : "редактирование предметы"
  tree : =>
    items : [
      module 'tutor/header/button' : {
        title : 'Описание'
        href  : '/tutor/edit/general'
      }
      module 'tutor/header/button' : {
        title : 'Условия'
        href  : '/tutor/edit/subjects'
      }
    ]
    sub_top_menu : state 'tutor/sub_top_menu' :
      items :
        'Предметы'     : 'subjects'
        'Место'        : 'location'
        'Календарь'    : 'calendar'
        'Предпочтения' : 'preferences'
      active_item : 'Предметы'
    content : module '$':
      subject           : module 'tutor/forms/drop_down_list'
      sections          : module 'tutor/forms/drop_down_list'
      destinations      : module 'tutor/forms/drop_down_list'
      category_students : module 'tutor/forms/drop_down_list'
      location          : module 'tutor/forms/drop_down_list'
      location_add      : module 'tutor/button' :
        text  : '+'
      price             : module 'tutor/forms/drop_down_list'
      add_location      : module 'tutor/button' :
        text      : '+'
        selector  : 'add'
      pupils_number     : module 'tutor/forms/drop_down_list'
      bet               : module 'tutor/forms/drop_down_list'
      comments          : module 'tutor/forms/textarea' :
        id     : 'comments'
        height : '82px'
      add_button        : module 'tutor/button' :
        text      : '+ Добавить'
        selector  : 'fixed'
      save_button       : module 'tutor/button' :
        text      : 'Сохранить'
        selector  : 'fixed'

  init : ->
    @parent.tree.left_menu.setActive 'Анкета'
    @parent.tree.left_menu.setLinks ['../profile', '../search_bids', '#', '#', '#', '#', '#']

