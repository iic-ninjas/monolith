class App.Views.MarkdownView extends Marionette.ItemView
  el: '.markdown-editor'
  template: false

  ui:
    input: "#input"
    output: "#output"

  events:
    'change @ui.input': 'updateModel'
    'keyup @ui.input': 'updateModel'

  initialize: ->
    @render()
    @updateModel()

  onRender: ->
    @ui.output.val(JSON.stringify(@model.toJSON(), undefined, 2))

  updateModel: ->
    text = @ui.input.val()
    game = App.Markdown.MarkdownParser.parse(text)
    @model.set(game.attributes)
    @render()
