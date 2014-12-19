class @main extends template '../registration_popup'
  route : '/tutor/profile/second_step'
  tree : ->
    content : module '$' :
      country : module 'tutor/template/forms/drop_down_list'
      city    : module 'tutor/template/forms/drop_down_list'
      address_button : module '//address_button'
      line    : module 'tutor/template/separate_line' :
        selector : 'horizon'
      mobile_phone   : module 'tutor/template/forms/input'
      extra_phone    : module 'tutor/template/forms/input'
      post    : module 'tutor/template/forms/input'
      skype   : module 'tutor/template/forms/input'
      site    : module 'tutor/template/forms/input'

  init : ->
    @parent.tree.popup.progress_bar.progress = 2