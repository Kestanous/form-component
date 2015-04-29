class @FormComponent extends BlazeComponent
  @register 'FormComponent'
  template: -> 'FormComponent'

  onCreated: -> 

  events: -> [
    'submit': @onSubmit
  ]

  onSubmit: (e, t) ->
    e.preventDefault()

    console.log 'onSubmit in FormComponent', @

    #make sure the form is valid
    return unless @runValidations()
    #get the data
    data = {}
    for input in @getInputs()
      data[input.data().name] = input.value()
    #send the data to the hook
    @save(data)

  isValid: ->
    _.every( @getInputs(), (input) -> input.isValid() )
  isInvalid: -> not @isValid()

  getInputs: -> @componentChildrenWith 'InputComponent'

  runValidations: ->
    _.every( @getInputs(), (input) -> input.runValidate() )


  save: (data) -> #noop to keep it happy