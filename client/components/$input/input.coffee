class @InputComponent extends BlazeComponent
  @register 'InputComponent'
  template: -> 'InputComponent'
  InputComponent: true
  onCreated: ->
    data = @data()

    if data.name
      @name = data.name
    else
      throw new Meteor.Error('InputComponent', 'no name given')

    @currentValue = new ReactiveVar() 
    @invalid  = new ReactiveVar()
    @invalidMessage  = new ReactiveVar()
    
  onRendered: ->
    
  invalidClass: -> 'invalid' if @invalid.get()

  events: -> [
    'change input': @onChange
  ]

  onChange: (e, t) -> 
    @currentValue.set e.target.value
    @runValidate(e.target.value)

  value: -> @currentValue.get()

  runValidate: (value) ->
    if @validator
      output = @validator(@name, value) 
      @invalid.set not output.valid
      @invalidMessage.set output.message
      output.valid
    else
      true

  isValid: () -> not @invalid.get()


class InputComponent.Text extends InputComponent
  @register 'InputComponent.Text'
  template: -> 'InputComponent.Text'

class @InputComponent.Checkbox extends InputComponent
  @register 'InputComponent.Checkbox'
  template: -> 'InputComponent.Checkbox'
  onRendered: ->
    @currentValue.set false #always return boolean

  onChange: (e, t) -> 
    e.preventDefault()
    value = not @currentValue.get()
    @currentValue.set value
    @runValidate(value)