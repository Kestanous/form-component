class @ExampleComponent extends FormComponent
  @register 'ExampleComponent'
  template: -> 'ExampleComponent'
  onRendered: ->
    #TODO
    # for input in @componentChildren()
    #   input.validator = (key, value) => 

  save: (data) -> 
    console.log 'example', @data(), data

