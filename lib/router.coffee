#user config and sign in
FlowRouter.route '/',
  action: (params) -> FlowLayout.render "mainLayout", main: 'homeView'