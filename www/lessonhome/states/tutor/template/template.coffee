class @main
  tree : -> module 'tutor/template' :
    depend        : [
      module 'tutor/edit'
      state 'lib'
    ]
    header        : state './header'  :
      icons       : module 'tutor/template/header/icons'
      items : [
        module 'tutor/template/header/button' : {
          title : 'Описание'
          href  : '/search'
        }
        module 'tutor/template/header/button' : {
          title : 'Условия'
          href  : '/subjects_and_conditions'
        }
        module 'tutor/template/header/button' : {
          title : 'Отзывы'
          href  : '/reviews'
        }
      ]
    left_menu     : state './left_menu'
    sub_top_menu  : @exports()   # define if exists
    content       : @exports()   # must be defined
    vars :
      input_width1 : '335px'
      input_width2 : '90px'
      input_width3 : '100px'
  setTopMenu : (active, items)=>
    @tree.header.top_menu.items        = items
    @tree.header.top_menu.active_item  = active